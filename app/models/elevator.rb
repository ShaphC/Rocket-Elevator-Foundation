class Elevator < ApplicationRecord
    belongs_to :column, optional: true
    # before_save :previous_elevator_status,
    #      :if => proc {|elevator| elevator.status == 'Intervention'}
    after_update :elevator_status_change, :notify_slack,#:send_message, 
        :if => proc {|elevator| elevator.status == 'Intervention'}


    after_update :elevator_status_change, :send_message, :textToSpeech,
        :if => proc {|elevator| elevator.status == 'Intervention'}

    def elevator_status_change
        @elevator = Elevator.order(:updated_at).last
    end

<<<<<<< HEAD
    # def previous_elevator_status
    #     @elevator2 = Elevator.order(:updated_at).last
    # end
    
    # def send_message
    # client = Twilio::REST::Client.new
    #     client.messages.create({
    #         from: ENV["twilio_phone_number"],
    #         to: ENV["twilio_user_number"],
    #         body: "The elevator ID is #{@elevator.id} and the Serial number is #{@elevator.serial_number}"
    #     })
    # end

    def notify_slack
        SlackNotifier::CLIENT.ping "The Elevator #{@elevator.id} with Serial Number #{@elevator.serial_number} changed status from #{@elevator.status} to #{@elevator.status}."
    end
end
=======
    def send_message
    client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV["twilio_phone_number"],
            to: ENV["twilio_user_number"],
            body: "The elevator ID is...#{@elevator.id} and the Serial number is...#{@elevator.serial_number}"
        })
    end
end
>>>>>>> dev
