require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"


class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :exception   

    helper_method :textToSpeech

    def textToSpeech
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: ENV["WATSON_TTS_API_KEY"]
        )

        textToSpeech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )

        textToSpeech.service_url = ENV["WATSON_TTS_URL"]

        message = "Hello user number #{current_user.id}! There are currently #{Elevator::count} elevators deployed in the #{Building::count} buildings
                   of your #{Customer::count} customers. Currently, #{Elevator.where(status: "Intervention").count} elevators are not in Running Status and are being serviced.
                   You currently have #{Lead::count} leads in your contact requests. #{Battery::count} batteries are deployed across 
                   #{Address.select(:city).distinct.count} cities."
    
        File.open("#{Rails.root}/public/outputs.mp3", "wb") do |audio_file|
            response = textToSpeech.synthesize(
                text: message,
                accept: "audio/mp3",
                voice: "en-US_AllisonVoice"
            ).result
            # audio_file << response
            audio_file.write(response)
        end
    end
end

#{Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count}