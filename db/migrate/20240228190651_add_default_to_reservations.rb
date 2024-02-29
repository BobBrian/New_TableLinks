class AddDefaultToReservations < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :is_active, :boolean, default: true, null: false
  end
end

