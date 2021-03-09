class TwilioTextMessenger
    attr_reader :message
    
    def initialize(message)
        @message = message
    end
    
    def call
    client = Twilio::REST::Client.new
        client.messages.create({
            from: ENV["twilio_phone_number"],
            to: ENV["twilio_user_number"],
            body: message
        })
    end
end