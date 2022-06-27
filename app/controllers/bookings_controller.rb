class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id].to_i)
    params[:passengers].to_i.times { @booking.passengers << Passenger.new }
    # binding.pry
  end

  def create
    @booking = Booking.new(flight_id: params[:booking][:flight_id].to_i, confirmation: generate_confirmation_code, tickets: params[:booking][:tickets].to_i)

    if @booking.save
      for key, value in passengers_attributes do
        @booking.passengers << Passenger.create(name: value[:name], email: value[:email])
      end
      PassengerMailer.with(booking_id: @booking.id).thank_you.deliver_later
      redirect_to @booking
    else
      render 'new'
    end
  end

  private
  def passengers_attributes
    params.require(:booking).require(:passengers_attributes)
  end

  def generate_confirmation_code
    (0...10).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  end 
end