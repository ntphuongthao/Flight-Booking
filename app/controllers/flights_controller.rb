class FlightsController < ApplicationController
  def index
    @flights = Flight.where(departure_id: flight_params[:departure_id], arrival_id: flight_params[:arrival_id], date: flight_params[:date])
  end

  private

  def flight_params
    if params[:flight]
      params.require(:flight).permit(:departure_id, :arrival_id, :date)
    else
      {departure_id: 71, arrival_id: 75, date: Time.now}
    end
  end

  def passengers
    params.require(:flight).permit(:passengers)
  end
end
