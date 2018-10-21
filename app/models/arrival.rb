class Arrival < ApplicationRecord
  CPH_URL = 'https://www.cph.dk/en/flight-information/arrivals'.freeze

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
