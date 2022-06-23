class Airport < ApplicationRecord
  has_many :departured_flights,
            class_name: :Flight,
            foreign_key: :departure_id,
            dependent: :destroy

  has_many :arrived_flights,
            class_name: :Flight,
            foreign_key: :arrival_id,
            dependent: :destroy
end
