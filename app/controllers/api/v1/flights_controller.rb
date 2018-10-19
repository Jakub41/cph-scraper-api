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

      render json: data.to_json, status: :ok, message: 'Loaded all flights'
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
                    start_date = Date.parse(params[:start_date]) rescue ''
                    end_date   = Date.parse(params[:end_date]) rescue ''
                    if start_date.present? && end_date.present?
                      Arrival.between(start_date, end_date).order(:date, :time)
                    elsif start_date.present?
                      Arrival.from_date(start_date).order(:date, :time)
                    elsif end_date.present?
                      Arrival.till_date(end_date).order(:date, :time)
                    else
                      Arrival.all.order(:date, :time)
                    end
                  end
      data = data.where(airline: params[:airline]) if params[:airline].present?
      data = data.where(flight_no: params[:flight_no]) if params[:flight_no].present?
      data = data.where(time: params[:time]) if params[:time].present?
      data = data.where("arriving_from ilike ?", "%#{params[:from]}%").uniq if params[:from].present?
      return data
    end

    def filter_departures
      @departures = if params[:type].present? && params[:type] != 'departure'
                      []
                    else
                      start_date   = Date.parse(params[:start_date]) rescue ''
                      end_date     = Date.parse(params[:end_date]) rescue ''
                      if start_date.present? && end_date.present?
                        Departure.between(start_date, end_date).order(:date, :time)
                      elsif start_date.present?
                        Departure.from_date(start_date).order(:date, :time)
                      elsif end_date.present?
                        Departure.till_date(end_date).order(:date, :time)
                      else
                        Departure.all.order(:date, :time)
                      end
                    end
      data = data.where(airline: params[:airline]) if params[:airline].present?
      data = data.where(flight_no: params[:flight_no]) if params[:flight_no].present?
      data = data.where(time: params[:time]) if params[:time].present?
      data = data.where("destination ilike ?", "%#{params[:destination]}%").uniq if params[:destination].present?
      return data
    end
  end
end

