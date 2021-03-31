require 'json'
require 'net/http'
# require 'uri'
# require 'httparty'

module ElevatorMedia

    class Streamer

        def self.getContent#(my_content)
            
            @url = "https://api.openweathermap.org/data/2.5/weather?q=Quebec&appid=#{ENV["weather_api_key"]}"
            @uri = URI(@url)
            @resp = Net::HTTP.get(@uri)

            @output = JSON.parse(@resp)

            data = "#{@output["name"]} Weather: #{@output["weather"].first.fetch("main")}, #{@output["weather"].first.fetch("description")}, Temperature: #{@output["main"]["temp"] - 272.15}°C"
            
            return data
        end

        # def self.getWeather
        #     client = OpenWeather::Client.new(api_key: ENV["weather_api_key"])

        #     data = client.current_weather(city: 'London')

        #     puts "#{data}"

        #     return data
        # end
    end
end