# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Flight duration
def get_duration
  rand(60..180)
end

def random_time
  times = ['7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00',
          '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00']
  time = times[rand(times.length)]
end

ActiveRecord::Base.transaction do
  Flight.destroy_all
  Airport.destroy_all

  airports = []
  airports[0] = Airport.create!(name: 'Ha Noi', code: 'HAN')
  airports[1] = Airport.create!(name: 'Ba Ria - Vung Tau', code: 'VCS')
  airports[2] = Airport.create!(name: 'Can Tho', code: 'VCA')
  airports[3] = Airport.create!(name: 'Hai Phong', code: 'HPH')
  airports[4] = Airport.create!(name: 'Ho Chi Minh', code: 'SGN')
  airports[5] = Airport.create!(name: 'Da Nang', code: 'DAD')
  airports[6] = Airport.create!(name: 'Thua Thien Hue', code: 'HUI')
  airports[7] = Airport.create!(name: 'Thanh Hoa', code: 'THD')
  airports[8] = Airport.create!(name: 'Dien Bien', code: 'DIN')
  airports[9] = Airport.create!(name: 'Ca Mau', code: 'CAH')


  Date.new(2022, 7, 1).upto(Date.new(2022, 9, 30)).each do |date|
    airports.each do |departure|
      airports.each do |arrival|
        next if departure == arrival

        10.times { Flight.create!(date: date,
                                time: random_time,
                                departure: departure,
                                arrival: arrival,
                                duration: get_duration) }
      end
    end
  end
end
