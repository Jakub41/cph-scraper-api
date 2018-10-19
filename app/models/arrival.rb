class Arrival < ApplicationRecord
  include FilterableFlights

  CPH_URL = 'https://www.cph.dk/en/flight-information/arrivals'.freeze

  scope :arriving_from, ->(arriving_from) do
    where('lower("arriving_from") like ?', "%#{arriving_from.downcase}%")
  end

  def in_hash
    {
        time: time || '',
        date: date || '',
        expected: expected || '',
        airline: airline || '',
        arriving_from: arriving_from || '',
        flight_no: flight_no || '',
        gate: gate || '',
        terminal: terminal || '',
        status: status || ''
    }
  end

  def self.filter(params)
    arrivals = filter_by_dates(params[:start_date], params[:end_date])

    arrivals = arrivals.airline(params[:airline]) if params[:airline]
    arrivals = arrivals.arriving_from(params[:arriving_from]) if params[:arriving_from]
    arrivals = arrivals.flight_no(params[:flight_no]) if params[:flight_no]
    arrivals = arrivals.from_time(params[:from_time]) if params[:from_time]
    arrivals = arrivals.till_time(params[:till_time]) if params[:till_time]

    arrivals.order(:date, :time)
  end
end
