require 'rails_helper'
require './app/controllers/leads_controller.rb'


RSpec.describe LeadsController::Lead do
    describe '#getLeads' do
        lead = Lead.create(
            full_name: "Leffler-Mertz",
            email: "marion@ankunding.org",
            phone: "470-100-2181",
            company_name: "Troy Stokes",
            project_name: "Test",
            department: "Residential",
            project_description: "Test Desc.",
            message: "Test Message"
        )
        context 'checks that the response is not empty' do
            it 'returns a response' do
                expect(lead).not_to be(nil)
            end
        end
        context 'checks that the response is a string' do
            it 'returns a string' do
                expect(lead.full_name).to be_a_kind_of(String)
                expect(lead.company_name).to be_a_kind_of(String)
                expect(lead.message).to be_a_kind_of(String)
            end
        end
    end
end