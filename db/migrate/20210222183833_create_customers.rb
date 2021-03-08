class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.date :date_create
      t.string :company_name
      t.string :cpy_contact_full_name
      t.string :cpy_contact_phone
      t.string :cpy_contact_email
      t.string :cpy_description
      t.string :tech_authority_service_full_name
      t.string :tech_authority_service_phone
      t.string :tech_manager_service_email

      t.timestamps
    end
  end
end
# double check for the date creation CUstomer can we use the t.timestamp