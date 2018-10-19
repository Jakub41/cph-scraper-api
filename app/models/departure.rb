class Departure < ApplicationRecord
  include FilterableFlights

  CPH_URL = 'https://www.cph.dk/en/flight-information/departures'.freeze

  scope :destination, ->(destination) do
    where('lower("destination") like ?', "%#{destination.downcase}%")
  end

  def in_hash
    {
        time: time || '',
        date: date || '',
        expected: expected || '',
        airline: airline || '',
        destination: destination || '',
        flight_no: flight_no || '',
        gate: gate || '',
        terminal: terminal || '',
        status: status || ''
    }
  end

   def self.filter(params)
    departures = filter_by_dates(params[:start_date], params[:end_date])

    departures = departures.airline(params[:airline]) if params[:airline]
    departures = departures.destination(params[:destination]) if params[:destination]
    departures = departures.flight_no(params[:flight_no]) if params[:flight_no]
    departures = departures.from_time(params[:from_time]) if params[:from_time]
    departures = departures.till_time(params[:till_time]) if params[:till_time]

    departures.order(:date, :time)
  end
end
