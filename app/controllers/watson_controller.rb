require "ibm_watson"
include IBMWatson

class WatsonController < ApplicationController
    def textToSpeech
        # authenticator = ENV["WATSON_TTS_API_KEY"]
        authenticator = "wEJLUxt1PusRSEYrqs31HSQaeKK2BN_Fri9ghFN-ZYNX"
        
        textToSpeech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )

        # textToSpeech.service_url = ENV["WATSON_TTS_URL"]
        textToSpeech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/1123f030-83e2-45ef-8b86-0e7bc445d2d0"

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