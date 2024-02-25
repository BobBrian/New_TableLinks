class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.string :table_name
      t.integer :seat_numbers

      t.timestamps
    end
  end
end
