class AddDefaultToTables < ActiveRecord::Migration[7.1]
  def change
    change_column :tables, :is_available, :boolean, default: true, null: false
  end
end
