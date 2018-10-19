module Api::V1
  class FlightsController < ApplicationController
    before_action :filter_arrivals, only: :index
    before_action :filter_departures, only: :index

    def index
      arrivals          = @arrivals.map(&:in_hash)
      departures        = @departures.map(&:in_hash)
      data              = {}
      data[:arrivals]   = arrivals if arrivals.present?
      data[:departures] = departures if departures.present?

      render json: data.to_json, status: :ok
    end

    def destroy_all
      Arrival.all.delete_all
      Departure.all.delete_all
      render json: 'All data deleted.', status: :ok
    end

    private

    def filter_arrivals
      @arrivals = if params[:type].present? && params[:type] != 'arrival'
                    []
                  else
                    Arrival.filter(search_params)
                  end
    end

    def filter_departures
      @departures = if params[:type].present? && params[:type] != 'departure'
                      []
                    else
                      Departure.filter(search_params)
                    end
    end

    def search_params
      @search_params ||= params.fetch(:filter, {}).permit(
        :start_date,
        :end_date,
        :airline,
        :arriving_from,
        :flight_no,
        :destination,
        :from_time,
        :till_time
      ).tap do |permitted_params|
        permitted_params[:start_date] = Date.parse(permitted_params[:start_date]) rescue nil
        permitted_params[:end_date] = Date.parse(permitted_params[:end_date]) rescue nil
      end
    end
  end
end

