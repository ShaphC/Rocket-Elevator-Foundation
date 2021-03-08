class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :type_building
      t.string :status
      t.date :date_commissioning
      t.date :date_last_inspection
      t.string :certificate_operations
      t.string :information
      t.text :notes

      t.timestamps
    end
  end
end
