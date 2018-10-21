module Api::V1

  class FlightsController < ApplicationController

    def index
      data = {}
      data[:arrivals]   = Flight.arrivals
      data[:departures] = Flight.departures

      render json: data.to_json, status: :ok
    end

    def destroy_all
      Flight.delete_all
      render json: 'All data deleted.'.to_json, status: :ok
    end

    def filter
      return render json: [], status: :unprocessable_entity if invalid_flight_type?

      render json: Flight.filter!(flight_params).to_json, status: :ok
    rescue Flight::InvalidParamsError => error
      render json: error.message.to_json, status: :unprocessable_entity
    rescue => e
      render json: 'Error'.to_json, status: :unprocessable_entity
    end

    private

    def invalid_flight_type?
      Flight.invalid_flight_type?(flight_params[:type])
    end

    def flight_params
      params.permit(:type, :airline, :date, :time, :flight_number, :from, :destination)
          .to_hash.with_indifferent_access
    end
  end
end
