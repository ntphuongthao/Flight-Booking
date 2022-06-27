class PassengerMailer < ApplicationMailer
  def thank_you
    @booking = Booking.find(params[:booking_id])
    # binding.pry
    @url = booking_url(@booking)
    mail(to: @booking.passengers.pluck(:email),
         subject: "Thank you for booking Flight ##{@booking.confirmation}"
    )
  end
end
