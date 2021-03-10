require 'zendesk_api'

class LeadsController < ApplicationController
    def new
        @lead = Lead.new
    end
    
    def create
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
            
            # subject = "Subject: #{params['full_name']} from #{params['company_name']}\n"
            # comment = "Comment: The contact #{params['full_name']} from company #{params['company_name']} can be reached at email #{params['email']} and at phone number #{params['phone']}. #{params['department']} has a project named #{params['project_name']} which would require contribution from Rocket Elevators.\n\n Project Description: #{params['project_description']}.\n\n Attached Message: #{param['message']}}"

            # POST /api/v2/tickets.json
            ZendeskAPI::Ticket.create(client, :subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")


            redirect_to main_app.root_path, notice: "Message sent!"

        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    private
    def fact_contacts

      dwh = PG::Connection.new(port: 5432, dbname: "AdrienGobeil_psql", user: "postgres", password: "postgres")
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