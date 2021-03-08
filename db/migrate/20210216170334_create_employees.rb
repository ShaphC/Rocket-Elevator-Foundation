class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :function
      t.string :phone
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
