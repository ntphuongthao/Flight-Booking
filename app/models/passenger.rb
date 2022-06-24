class Passenger < ApplicationRecord
  has_many :passenger_bookings, dependent: :destroy
  has_many :bookings, through: :passenger_bookings
end
