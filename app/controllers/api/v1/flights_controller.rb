module Api::V1

  class FlightsController < ApplicationController

    def index
      arrivals          = Arrival.all.map(&:in_hash)   # this is extremelly slow
      departures        = Departure.all.map(&:in_hash) # this is extremelly slow
      data              = {}
      data[:arrivals]   = arrivals if arrivals.present?
      data[:departures] = departures if departures.present?

      render json: data.to_json, status: :ok
    end

    def destroy_all
      Arrival.delete_all
      Departure.delete_all
      render json: 'All data deleted.', status: :ok
    end

    def filter
      return render json: [], status: :unprocessable_entity if invalid_flight_type?

      render json: Flights.filter!(flight_params), status: :ok
    rescue Flights::InvalidParamsError => error
      render json: error.message.to_json, status: :unprocessable_entity
    rescue => e
      render json: 'Error'.to_json, status: :unprocessable_entity
    end

    private

    def invalid_flight_type?
      Flights.invalid_flight_type?(flight_params[:type])
    end

    def flight_params
      params.permit(:type, :airline, :date, :time, :flight_number, :from, :destination)
          .to_hash.with_indifferent_access
    end
  end
end

