class FlightsController < ApplicationController
  def index
    @flights = Flight.where(departure_id: flight_params[:departure_id], arrival_id: flight_params[:arrival_id], date: flight_params[:date])
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_id, :arrival_id, :date)
  end

  def passengers
    params.require(:flight).permit(:passengers)
  end
end
