class Elevator < ApplicationRecord
    after_update :elevator_status_change, :send_message, 
        :if => proc {|elevator| elevator.status == 'Intervention'}
    belongs_to :column, optional: true

    def elevator_status_change
        @elevator = Elevator.order(:updated_at).last
    end

    def send_message
    client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV["twilio_phone_number"],
            to: ENV["twilio_user_number"],
            body: "The elevator ID is...#{@elevator.id} and the Serial number is...#{@elevator.serial_number}"
        })
    end
end
