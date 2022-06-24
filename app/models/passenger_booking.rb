class PassengerBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger
end
