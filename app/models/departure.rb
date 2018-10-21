class Departure < ApplicationRecord
  CPH_URL = 'https://www.cph.dk/en/flight-information/departures'.freeze

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
end
