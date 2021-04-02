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
                expect(lead.full_name).not_to be(nil)
            end
        end
        context 'checks that the response is a string' do
            it 'returns a string' do
                expect(lead.full_name).to be_a_kind_of(String)
            end
        end

        # it 'check that the value us an integer' do
        #     expect(quote.number_of_apartments).to be_a(Integer)
        # end
        
        # it 'check that the name is a string' do
        #     expect(quote.quotes_company_name).to be_a_kind_of(String)
        # end
    end
end