class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :number_of_apartments
      t.integer :number_of_floors
      t.integer :number_of_basements
      t.integer :number_of_companies
      t.integer :number_of_corporations
      t.integer :number_of_floors
      t.integer :number_of_basements
      t.integer :number_of_parking
      t.integer :number_of_elevators
      t.integer :maximum_occupancy
      t.integer :business_hours
      t.integer :elevator_amount
      t.string :product_line
      t.string :quotes_name
      t.string :quotes_email
      t.string :quotes_company_name
      t.string :install_fees
      t.string :total_price
      t.string :unit_price
      t.string :building_type
      t.string :final_price
      t.timestamp :date

      t.timestamps
    end
  end
end
