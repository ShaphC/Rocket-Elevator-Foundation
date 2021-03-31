require 'rails_helper'
require './app/controllers/interventions_controller.rb'


RSpec.describe InterventionsController::Lead do
    describe 'get Leads' do
        intervention = Intervention.create(
            customer_id: 1,
            building_id: 1,
            battery_id: 1,
            column_id: 1,
            elevator_id: 1,
            employee_id: 1,
            report: "Testing",
        )

        it 'test the intervention response' do
            expect(intervention.column_id).to be_a(Integer)
            # expext(intervention.report).to be_a(String)
        end

        # it 'check that the value us an integer' do
        #     expect().to be_a(Integer)
        # end
        
        # it 'check that the name is a string' do
        #     expect().to be_a_kind_of(String)
        # end
    end
end