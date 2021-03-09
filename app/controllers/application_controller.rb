require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"

# class ApplicationController < ActionController::Base
#     skip_before_action :verify_authenticity_token
#     protect_from_forgery with: :exception   

#     helper_method :textToSpeech

#     def textToSpeech
#         puts '----------------------------------------------------------'
#         # authenticator = ENV["WATSON_TTS_API_KEY"]
#         authenticator = "wEJLUxt1PusRSEYrqs31HSQaeKK2BN_Fri9ghFN-ZYNX"
        
#         textToSpeech = IBMWatson::TextToSpeechV1.new(
#         authenticator: authenticator
#         )

#         # textToSpeech.service_url = ENV["WATSON_TTS_URL"]
#         textToSpeech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/1123f030-83e2-45ef-8b86-0e7bc445d2d0"

#         message = "Hello, this is a test message!"
        
#         response = textToSpeech.synthesize(
#             text: message,
#             accept: "audio/mp3",
#             voice: "en-US_AllisonVoice"
#         ).result
        
#         File.open("#{Rails.root}/public/outputs.mp3", "wb") do |audio_file|
#             audio_file.write(response)
#         end
#     end
# end 

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

        message = "Hello, this is a test message!"
    
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