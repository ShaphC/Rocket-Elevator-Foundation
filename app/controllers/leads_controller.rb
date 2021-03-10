require 'zendesk_api'

class LeadsController < ApplicationController

    # after_create :zendesk_lead_ticket
    
    def new
        @lead = Lead.new
    end
    
    def create

        client = ZendeskAPI::Client.new do |config|
            # Mandatory:
          
            config.url = ENV["zendesk_url"] # e.g. https://mydesk.zendesk.com/api/v2
            # config.url = "https://rocketelevators2021.zendesk.com/api/v2"

            # Basic / Token Authentication
            config.username = ENV["zendesk_username"]
            # config.username = "danigrum@gmail.com"
          
            # Choose one of the following depending on your authentication choice
            config.token = ENV["zendesk_auth_token"]
            config.password = ENV["zendesk_password"]
            # config.token = "zoLkKqlfJf80o8GzlAzr7F7SdXmuKGlL8desH9VY"
            # config.password = "rocketelevators"
            


            # CHECK IF WE REALLY NEED TO PUT OUR OAUTH ACCESS TOKEN --------------------------- TODO HERE !!!
            # OAuth Authentication
            ##config.access_token = "your OAuth access token"
          
            # Optional:
          
            # Retry uses middleware to notify the user
            # when hitting the rate limit, sleep automatically,
            # then retry the request.
            ##config.retry = true
          
            # Raise error when hitting the rate limit.
            # This is ignored and always set to false when `retry` is enabled.
            # Disabled by default.
            ##config.raise_error_when_rate_limited = false
          
            # Logger prints to STDERR by default, to e.g. print to stdout:
            ##require 'logger'
            ##config.logger = Logger.new(STDOUT)
          
            # Changes Faraday adapter
            # config.adapter = :patron
          
            # Merged with the default client options hash
            # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
          
            # When getting the error 'hostname does not match the server certificate'
            # use the API at https://yoursubdomain.zendesk.com/api/v2
            
        end

        puts (params) 
        file = lead_params[:file]
        @lead = Lead.new(lead_params.except(:file))
        if !file.nil?
            filedata = file.read
            
            @lead.file_attachment = filedata
            @lead.filename = file.original_filename
        end
        
        @lead.save!
        if @lead.save
            fact_contacts()
                                    
            # TODO HERE zendesk

            ZendeskAPI::Ticket.create!(client, :subject => "Subject: #{@full_name} from #{@company_name}\n", :comment => {:value => "The contact #{@full_name} from #{@company_name} can be reached at email: #{@email} and at phone number: #{@phone}. #{@department} has a project named: #{@project_name} which would require contribution from Rocket Elevators.\n\n Project Description: #{@project_description}.\n\n Attached Message: #{@message}"}, :priority => "normal", :type => "question")


            # :subject = "Subject: #{@full_name} from #{@company_name}\n"
            # :comment = "Comment: The contact #{@full_name} from company #{@company_name} can be reached at email #{@email} and at phone number #{@phone}. #{@department} has a project named #{@project_name} which would require contribution from Rocket Elevators.\n\n Project Description: #{@project_description}.\n\n Attached Message: #{@message}"

            # ticket = ZendeskAPI::Ticket.new(client, :id => current_user.id, :priority => "urgent") # doesn't actually send a request, must explicitly call #save!
            # ticket.save!

            # # POST /api/v2/tickets.json
            # ZendeskAPI::Ticket.create(client, :subject => "Test 12h52", :comment => "Test 12h52", :submitter_id => current_user.id, :priority => "urgent")
            # ticket = ZendeskAPI::Ticket.create(client, :subject => "Test 12h52", :comment => "Test 12h52", :submitter_id => "submitterID", :priority => "urgent")

            redirect_to main_app.root_path, notice: "Message sent!"

        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    private
    def fact_contacts

      dwh = PG::Connection.new(host: "localhost", port: 5432, dbname: "AdrienGobeil_psql", user: "postgres", password: "postgres")
    #   dwh = PG::Connection.new(port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")
      dwh.exec("TRUNCATE fact_contacts")

      dwh.prepare('to_fact_contacts', 'INSERT INTO fact_contacts (contact_id, creation_date, company_name, email, project_name, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Lead.all.each do |ldcontact|
      dwh.exec_prepared('to_fact_contacts', [ldcontact.id, ldcontact.created_at, ldcontact.company_name, ldcontact.email, ldcontact.project_name])
      end
    end
    def lead_params
      params.require(:lead).permit(:full_name, :email, :phone, :company_name, :project_name, :department, :project_description,
      :message, :file_attachment, :file, :image)
    end
end

# connection = ActiveRecord::Base.establish_connection(:dwh_development)