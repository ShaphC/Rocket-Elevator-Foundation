require 'rails_helper'
require './app/controllers/quotes_controller.rb'


RSpec.describe QuotesController::Quote do
    describe '#getQuote' do
        quote = Quote.create(
            building_type: "residential",
            number_of_apartments: 0,
            number_of_floors: 0,
            number_of_basements: 0,
            number_of_companies: 0,
            number_of_parking: 0,
            number_of_elevators: 0,
            number_of_corporations: 0,
            maximum_occupancy: 0,
            business_hours: 0,
            total_price: 0,
            elevator_amount: "0",
            unit_price: "0",
            total_price: "0",
            install_fees: "0",
            final_price: "0",
            quotes_company_name: "Troy Stokes",
            quotes_email: "marion@ankunding.org",
            quotes_name: "Leffler-Mertz"
        )
        context 'tests that the quote response is not empty' do   
            it 'returns a response' do
                expect(quote).not_to be(nil)
            end
        end
        context 'check that the value is an integer' do
            it 'returns an integer' do
                expect(quote.number_of_apartments).to be_a(Integer)
            end
        end
        context 'check that the name is a string' do
            it 'returns a string' do
                expect(quote.quotes_company_name).to be_a_kind_of(String)
            end
        end
    end
end