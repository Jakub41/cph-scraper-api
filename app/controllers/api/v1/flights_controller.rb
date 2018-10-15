module Api::V1
  class FlightsController < ApplicationController
    before_action :filter_arrivals, only: :index
    before_action :filter_departures, only: :index

    def index
      arrivals = @arrivals.map(&:in_hash)
      departures = @departures.map(&:in_hash)
      data = {}
      data[:arrivals] = arrivals if arrivals.present?
      data[:departures] = departures if departures.present?

      render json: data.to_json
    end

    def show
      #render json: @arrivals
      #render json: @departures
    end

    def destroy_all
    end

    def filter_arrivals
      @arrivals = if params[:type].present? && params[:type] != 'arrival'
                    []
                  else
                    start_date = Date.parse(params[:start_date]) rescue ''
                    end_date   = Date.parse(params[:end_date]) rescue ''
                    if start_date.present? && end_date.present?
                      Arrival.between(start_date, end_date)
                    elsif start_date.present?
                      Arrival.from_date(start_date)
                    elsif end_date.present?
                      Arrival.till_date(end_date)
                    else
                      Arrival.all
                    end
                  end
    end

    def filter_departures
      @departures = if params[:type].present? && params[:type] != 'departure'
                      []
                    else
                      start_date   = Date.parse(params[:start_date]) rescue ''
                      end_date     = Date.parse(params[:end_date]) rescue ''
                      if start_date.present? && end_date.present?
                        Departure.between(start_date, end_date)
                      elsif start_date.present?
                        Departure.from_date(start_date)
                      elsif end_date.present?
                        Departure.till_date(end_date)
                      else
                        Departure.all
                      end
                    end
    end
  end
end

