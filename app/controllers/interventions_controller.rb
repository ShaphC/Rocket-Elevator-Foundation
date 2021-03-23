class InterventionsController < ApplicationController

    def new
        @intervention = Intervention.new
    end

    def get_buildings
        @customer = Customer.find params[:customer_id]
        @buildings = @customer.buildings
    end

    def create

        # ZENDESK Quotes 1/2
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV["zendesk_url"]
            config.username = ENV["zendesk_username"]
            config.token = ENV["zendesk_auth_token"]
            config.password = ENV["zendesk_password"]
        end
        # END Zendesk 1/2

        @intervention = Intervention.new(intervention_params)

        # if !verify_recaptcha(model: @intervention)
        puts "#{current_user.id} is the author ID"
        @intervention.author_id = current_user.id
        @intervention.status = "Pending"
        @intervention.save!

        # fact_intervention()
        
        # ZENDESK 2/2
        # ZendeskAPI::Ticket.create!(client, :subject => "Subject: TBA from TBA\n\n", :comment => {:value => "The requestor is (TBA) for:\n\n Building ID: #{@intervention.building_id}\n Battery_ID: #{@intervention.battery_id}\n Column ID: #{@intervention.column_id}\n Elevator ID: #{@intervention.elevator_id}\n Employee: #{@intervention.employee_id}\n Description: #{@intervention.report}"}, :priority => "normal", :type => "problem")
        # END Zendesk 2/2

        redirect_to main_app.root_path, notice: "Intervention Sent!"
        # else    
        #     redirect_to "/intervention", notice: "Invalid captcha!"
        # end
    end

    private

    def fact_intervention
    dwh = PG::Connection.new(host: 'localhost', port: 5432, dbname: "Scharles_psql", user: "postgres", password: "postgres")
      dwh.exec("TRUNCATE fact_interventions")

      dwh.prepare('to_fact_interventions', 'INSERT INTO fact_interventions (building_id, battery_id, column_id, elevator_id, employee_id, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
      Intervention.all.each do |intervention|
      dwh.exec_prepared('to_fact_interventions', [intervention.building_id, intervention.battery_id, intervention.column_id, intervention.elevator_id, intervention.employee_id])
      end
        
    end
    def intervention_params
        params.require(:intervention).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
    end

end
