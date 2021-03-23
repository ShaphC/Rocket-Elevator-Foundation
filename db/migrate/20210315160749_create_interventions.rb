class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.references :author, foreign_key: { to_table: :employees}
      t.references :customer, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.datetime :intervention_start
      t.datetime :intervention_end
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
