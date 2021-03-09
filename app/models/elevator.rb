class Elevator < ApplicationRecord
    after_update :call, 
        :if => Proc.new {|elevators| elevators.status == 'Intervention'} 
    belongs_to :column, optional: true

    # @elevator = Elevator.find(515)
    # Elevator.all.each do |elevators|
    #     puts elevators.status
    # end
    
    def call
    client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV["twilio_phone_number"],
            to: ENV["twilio_user_number"],
            body: "The elevator ID is coming."
        })
    end
end

