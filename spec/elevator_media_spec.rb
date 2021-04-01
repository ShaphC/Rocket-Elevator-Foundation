require 'spec_helper'
require 'elevator_media'

RSpec.describe ElevatorMedia::Streamer, '#getContent' do
	describe 'running tests for a new media service' do
		streamer = ElevatorMedia::Streamer.new
		context 'checks that the response is not empty' do
			it 'returns a response' do
				expect(ElevatorMedia::Streamer.getContent).not_to be(nil)
			end
		end
		context 'queries OpenWeatherMap' do
			it 'returns a response' do
				puts ElevatorMedia::Streamer.getContent
				expect(ElevatorMedia::Streamer.getContent).to be_a_kind_of(String)
			end
		end
	end
end

