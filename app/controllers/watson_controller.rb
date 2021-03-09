require "ibm_watson"
include IBMWatson

class WatsonController < ApplicationController
    def textToSpeech
        authenticator = ENV["WATSON_TTS_API_KEY"]
        
        textToSpeech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )

        textToSpeech.service_url = ENV["WATSON_TTS_URL"]

        message = "Hello, this is a test message!"
        
        response = textToSpeech.synthesize(
            text: message,
            accept: "audio/mp3",
            voice: "en-US_AllisonVoice"
        ).result
        
        File.open("#{Rails.root}/public/outputs.mp3", "wb") do |audio_file|
            audio_file.write(response)
        end
    end
end

#ActionController??