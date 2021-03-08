class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :creation_date
      t.string :company_name
      t.string :fn_cpy_main_ct
      t.string :email_cpy_main_ct
      t.integer :nb_elevators
      t.string :customer_city

      t.timestamps
      
    end
  end
end
