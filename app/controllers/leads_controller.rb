# ZENDESK Leads 1/3
require 'zendesk_api'
# END Zendesk Leads 1/3

class LeadsController < ApplicationController
    
    def new
        @lead = Lead.new
    end
    
    def create

        
        # ZENDESK Leads 2/3
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV["zendesk_url"]
            config.username = ENV["zendesk_username"]
            config.token = ENV["zendesk_auth_token"]
            config.password = ENV["zendesk_password"]
        end
        # END Zendesk Leads 2/3


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

            # ZENDESK Leads 3/3
            ZendeskAPI::Ticket.create!(client, :subject => "Subject: #{@lead.full_name} from #{@lead.company_name}\n\n", :comment => {:value => "The contact #{@lead.full_name} from #{@lead.company_name} can be reached at email: #{@lead.email} and at phone number: #{@lead.phone}.\n\n #{@lead.department} has a project named: #{@lead.project_name} which would require contribution from Rocket Elevators.\n\n Project Description: \n#{@lead.project_description}.\n\n Attached Message: \n#{@lead.message}\n"}, :priority => "Priority: normal\n", :type => "Type: Question")
            # END Zendesk Leads 3/3

            redirect_to main_app.root_path, notice: "Message sent!"

        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    private
    def fact_contacts
<<<<<<< HEAD

      dwh = PG::Connection.new(host: "localhost", port: 5432, dbname: "AdrienGobeil_psql", user: "postgres", password: "postgres")
    #   dwh = PG::Connection.new(port: 5432, dbname: "MaximeAuger_psql", user: "postgres", password: "postgres")
=======
      dwh = PG::Connection.new(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', port: 5432, dbname: "AdrienGobeil_psql", user: "codeboxx", password: "Codeboxx1!")
>>>>>>> dev
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