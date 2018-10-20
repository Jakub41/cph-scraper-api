module Api::V1
  class FlightsController < ApplicationController

    def index
      arrivals = filter_arrivals
      departures = filter_departures
      data = {}

      data[:arrivals] = arrivals if arrivals.present?
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
      if params[:type].present? && params[:type] != 'arrival'
        data = []
      else
        start_date = Date.parse(params[:start_date]) rescue ''
        end_date = Date.parse(params[:end_date]) rescue ''
        if start_date.present? && end_date.present?
          data = Arrival.between(start_date, end_date).order(:date, :time)
        elsif start_date.present?
          data = Arrival.from_date(start_date).order(:date, :time)
        elsif end_date.present?
          data = Arrival.till_date(end_date).order(:date, :time)
        else
          data = Arrival.all.order(:date, :time)
        end

        data = data.where(airline: params[:airline]) if params[:airline].present?
        data = data.where(flight_no: params[:flight_no]) if params[:flight_no].present?
        data = data.where(time: params[:time]) if params[:time].present?
        data = data.where("arriving_from ilike ?", "%#{params[:from]}%").uniq if params[:from].present?
        return data
      end
    end

    def filter_departures
      if params[:type].present? && params[:type] != 'departure'
        data = []
      else
        start_date = Date.parse(params[:start_date]) rescue ''
        end_date = Date.parse(params[:end_date]) rescue ''
        if start_date.present? && end_date.present?
          data = Departure.between(start_date, end_date).order(:date, :time)
        elsif start_date.present?
          data = Departure.from_date(start_date).order(:date, :time)
        elsif end_date.present?
          data = Departure.till_date(end_date).order(:date, :time)
        else
          data = Departure.all.order(:date, :time)
        end

        data = data.where(airline: params[:airline]) if params[:airline].present?
        data = data.where(flight_no: params[:flight_no]) if params[:flight_no].present?
        data = data.where(time: params[:time]) if params[:time].present?
        data = data.where("destination ilike ?", "%#{params[:destination]}%").uniq if params[:destination].present?
        return data
      end
    end
  end
end
