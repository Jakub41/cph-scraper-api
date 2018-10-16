class Arrival < ApplicationRecord
  CPH_URL = 'https://www.cph.dk/en/flight-information/arrivals'.freeze

  scope :between, ->(start_date, end_date) { where(date: start_date..end_date) }
  scope :from_date, ->(start_date) { where('date >= ?', start_date) }
  scope :till_date, ->(end_date) { where('date <= ?', end_date) }

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
end
