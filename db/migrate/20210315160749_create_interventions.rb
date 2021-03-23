class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.references :customer
      t.references :building
      t.references :battery
      t.references :column
      t.references :elevator
      t.references :employee
      t.datetime :intervention_start
      t.datetime :intervention_end
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
