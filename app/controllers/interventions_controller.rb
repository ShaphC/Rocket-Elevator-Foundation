class InterventionsController < ApplicationController

    def get_buildings
        @intervention = Intervention.new
        @customers = Customer.all
        @buildings = []
        if params[:choice].present?
            @buildings = Customer.find(params[:choice]).buildings
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                render json: {buildings: @buildings}
                }
            end
        end
    end

    def get_batteries
        @intervention = Intervention.new
        @buildings = Building.all
        @batteries = []
        if params[:choice].present?
            @batteries = Building.find(params[:choice]).batteries
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                render json: {batteries: @batteries}
                }
            end
        end
    end

    def get_columns
        @intervention = Intervention.new
        @batteries = Battery.all
        @columns = []
        if params[:choice].present?
            @columns = Battery.find(params[:choice]).columns
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                render json: {columns: @columns}
                }
            end
        end
    end

    def get_elevators
        @intervention = Intervention.new
        @columns = Column.all
        @elevators = []
        if params[:choice].present?
            @elevators = Column.find(params[:choice]).elevators
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                render json: {elevators: @elevators}
                }
            end
        end
    end

    def new
        @intervention = Intervention.new
    end

    def getCustomer
        @customer = Array.new
        
        Customer.all.each do |c|
            @customer.append(c.company_name)
        end

        return @customer
    end

    def getEmployee
        @employee = Array.new

        Employee.all.each do |e|
            @employee.append(first_name)
        end

        return @employee
    end

    helper_method :getCustomer
    helper_method :getEmployee

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
        @intervention.author = current_user.id
        @intervention.result = "Incomplete"
        @intervention.status = "Pending"
        @intervention.save!

        fact_intervention()
        
        # ZENDESK 2/2
        ZendeskAPI::Ticket.create!(client, :subject => "Subject: Intervention request from #{Employee.find(current_user.id).first_name}\n\n", :comment => {:value => "The requestor is #{Employee.find(current_user.id).first_name} #{Employee.find(current_user.id).last_name} for #{Customer.find(@intervention.customer_id).company_name}\n\n Building ID: #{@intervention.building_id}\n Battery_ID: #{@intervention.battery_id}\n Column ID: #{@intervention.column_id}\n Elevator ID: #{@intervention.elevator_id}\n Assigned Employee: #{Employee.find(@intervention.employee_id).first_name} #{Employee.find(@intervention.employee_id).last_name}\n Description: #{@intervention.report}"}, :priority => "normal", :type => "problem")
        # END Zendesk 2/2

        # redirect_to main_app.root_path, notice: "Intervention Sent!"
        redirect_to "/admin", notice: "Intervention Sent!"
        # else    
        #     redirect_to "/intervention", notice: "Invalid captcha!"
        # end
    end

    private

    def fact_intervention
    dwh = PG::Connection.new(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', port: 5432, dbname: "dwh_scharles", user: "codeboxx", password: "Codeboxx1!")
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
