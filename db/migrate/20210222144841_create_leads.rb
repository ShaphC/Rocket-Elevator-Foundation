class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :company_name
      t.string :project_name
      t.string :department
      t.string :project_description
      t.text :message
      t.binary :file_attachment

      t.timestamps
    end
  end
end
