class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_time
      t.boolean :inactive

      t.timestamps
    end
  end
end
