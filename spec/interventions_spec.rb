require 'rails_helper'
require './app/controllers/interventions_controller.rb'


RSpec.describe InterventionsController::Intervention do
    describe '#getInterventions' do
        intervention = Intervention.create(
            customer_id: 1,
            building_id: 1,
            battery_id: 1,
            column_id: 1,
            elevator_id: 1,
            employee_id: 1,
            report: "Testing",
        )
		context 'checks that the response is not empty' do
			it 'returns a response' do
				expect(intervention).not_to be(nil)
			end
		end
        context 'test the intervention response is an integer' do
            it 'returns an integer' do
                expect(intervention.column_id).to be_a(Integer)
                # expext(intervention.report).to be_a(String)
            end
        end
        context 'check that the report is a string' do
            it 'returns a string' do
                expect(intervention.report).to be_a_kind_of(String)
            end
        end
    end
end