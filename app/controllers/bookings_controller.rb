class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id)
  end
end