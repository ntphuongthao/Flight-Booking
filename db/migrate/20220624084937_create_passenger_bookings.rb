class CreatePassengerBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :passenger_bookings do |t|
      t.integer :booking_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end
