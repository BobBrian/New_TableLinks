class AddIsAvailableToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :is_available, :boolean
  end
end
