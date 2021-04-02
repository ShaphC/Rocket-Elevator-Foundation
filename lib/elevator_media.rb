require 'json'
require 'net/http'
# require 'uri'
# require 'httparty'

module ElevatorMedia

    class Streamer

        def self.getContent#(my_content)
            
            #Pulls data from the API
            @url = "https://api.openweathermap.org/data/2.5/weather?q=Quebec&appid=#{ENV["weather_api_key"]}"
            @uri = URI(@url)

            #Puts the data into a variable
            @resp = Net::HTTP.get(@uri)

            #Formats the data as JSON
            @output = JSON.parse(@resp)

            #Takes only the specific Information that I want to display
            data = "#{@output["name"]} Weather: #{@output["weather"].first.fetch("main")}, #{@output["weather"].first.fetch("description")}, Temperature: #{(@output["main"]["temp"] - 272.15).round(2)}°C"
            
            # getWeather

            return data
        end

        # def self.getWeather
        #     client = OpenWeather::Client.new(api_key: ENV["weather_api_key"])

        #     data = client.current_weather(city: 'London')

        #     puts "checking #{data}"

        #     return data
        # end
    end
end