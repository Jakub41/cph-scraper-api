class Flight < ApplicationRecord
  class InvalidParamsError < StandardError; end

  validates :is_arrival, presence: true, inclusion: { in: [0, 1], message: 'is_arrival - 0 for departure, 1 for arrival' }
  validates :date,       presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: 'Date format is YYYY-DD-MM' }
  validates :time,       presence: true, format: { with: /\A([0-1][0-9]|2[0-3]):[0-5][0-9]\z/, message: 'Time format is HH:MM:SS' }
  validates :airline,    presence: true
  validates :flight_no,  presence: true

  scope :arrivals, ->() { where(is_arrival: 1) }
  scope :departures, ->() { where(is_arrival: 0) }

  ARRIVAL_FLIGHT_TYPE   = 'arrivals'
  DEPARTURE_FLIGHT_TYPE = 'departures'

  TIME_REGEX  = /^([0-1][0-9]|2[0-3]):[0-5][0-9]$/
  TIME_PARAMS = [:date, :time]

  PARAMS_MAPPING = {
      type: :is_arrival,
      airline: :airline,
      date: :date,
      time: :time,
      flight_number: :flight_no,
      from: :arriving_from,
      destination: :destination
  }.with_indifferent_access

  def self.filter!(params)
    params = sanitize(params)

    validate_time!(params.slice(*TIME_PARAMS))

    flights = Flight.order(:date, :time)

    params.each { |field, value| flights = flights.where(PARAMS_MAPPING[field] => value) }

    flights
  end

  private

  def self.invalid_flight_type?(type)
    !type.in? [ARRIVAL_FLIGHT_TYPE, DEPARTURE_FLIGHT_TYPE]
  end

  def self.sanitize(params)
    params = params.with_indifferent_access
    params.compact!

    is_arrival = params[:type] == ARRIVAL_FLIGHT_TYPE ? 1 : 0
    params[:type] = is_arrival
    params
  end

  def self.validate_time!(params)
    return if params.empty?

    errors = []
    errors << :time if params[:time] && !params[:time] =~ TIME_REGEX
    if params[:date]
      date = params[:date].to_date rescue nil
      errors << :date unless date
    end

    raise Flight::InvalidParamsError.new("Invalid params: #{errors.join(', ')}") if errors.present?
  end
end
