class AddTicketsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :tickets, :int
  end
end
