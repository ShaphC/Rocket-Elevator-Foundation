class AddFilenameToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :filename, :string
  end
end
