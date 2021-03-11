require 'sendgrid-ruby'
include SendGrid
require 'json'

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
            redirect_to main_app.root_path, notice: "Message sent!"
            sendgrid()
        else    
            redirect_to "/leads", notice: "Invalid fields!"
        end
    end

    def sendgrid
        from = Email.new(email: 'Rocketmax.xyz@gmail.com')
        subject = 'We thank you for contacting Rocket Elevators'
        to = Email.new(email: lead_params[:email])
        content = Content.new(type: 'text/html', value: 
            "<html>
                <body>
                <p>Greetings #{lead_params[:full_name]},</p>
                <p>We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{lead_params[:project_name]}.</p>
                <p>A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.</p><br/>
                <p style='color:#0b64a0;'>We’ll Talk soon,</p>
                <p style='color:b10b1b;'>The Rocket Elevators Team</p>
                <img src='http://cdn.mcauto-images-production.sendgrid.net/3de8595335707c70/0fb39c8b-88c6-49ed-a7a2-e44a91fb762c/140x50.png'>
                <p>Address: 4468 Wellington St Suite 204, Verdun, Québec H4G 1W5<br/>
                Phone: (418) 555-1234<br/>
                Email: info@codeboxx.biz<br/>
                This is an automated message, please do not reply</p>
                <hr/>
                </body>
            </html>")
        mail = SendGrid::Mail.new(from, subject, to, content)
        # puts JSON.pretty_generate(mail.to_json)
        puts mail.to_json

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end

    private
    def fact_contacts
      dwh = PG::Connection.new(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', port: 5432, dbname: "AdrienGobeil_psql", user: "codeboxx", password: "Codeboxx1!")
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