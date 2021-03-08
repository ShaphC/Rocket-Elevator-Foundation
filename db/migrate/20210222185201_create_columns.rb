class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :type_building
      t.integer :number_floors_served
      t.string :status
      t.string :information
      t.text :notes

      t.timestamps
    end
  end
end
