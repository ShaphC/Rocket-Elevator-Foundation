class Elevator < ApplicationRecord
    belongs_to :column, optional: true
    before_update :previous_elevator_status,
        :if => proc {|elevator| elevator.status == 'Intervention'}
    after_update :elevator_status_change, :notify_slack, :send_message, 
        :if => proc {|elevator| elevator.status == 'Intervention'}

    def previous_elevator_status
        @status = self.status_was
    end
        
    def elevator_status_change
        @elevator = self
    end
    
    def send_message
    client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV["twilio_phone_number"],
            to: ENV["twilio_user_number"],
            body: "The elevator ID is #{@elevator.id} and the Serial number is #{@elevator.serial_number}"
        })
    end

    def notify_slack
        SlackNotifier::CLIENT.ping "The Elevator #{@elevator.id} with Serial Number #{@elevator.serial_number} changed status from #{@status} to #{@elevator.status}."
    end
end
