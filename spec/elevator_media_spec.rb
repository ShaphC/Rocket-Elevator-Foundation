require 'spec_helper'
require 'elevator_media'

RSpec.describe ElevatorMedia::Streamer, '#getContent' do
	describe 'running tests for a new media service' do
		streamer = ElevatorMedia::Streamer.new
		context 'queries OpenWeatherMap' do
			it 'returns a response' do
				puts ElevatorMedia::Streamer.getContent
				expect(ElevatorMedia::Streamer.getContent).to be_a_kind_of(String)
			end
		end

		# context 'test other way of openweathermap' do
		# 	it 'first test' do

		# 		expect(streamer.getWeather).to eql(String)
		# 	end
		# end
	end
end

