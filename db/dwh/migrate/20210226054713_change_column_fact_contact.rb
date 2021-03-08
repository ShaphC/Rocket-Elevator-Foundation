class ChangeColumnFactContact < ActiveRecord::Migration[5.2]
  def change 
    change_column :fact_contacts, :creation_date, :datetime
  end
end
