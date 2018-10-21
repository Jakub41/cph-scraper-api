module Flights

  class InvalidParamsError < StandardError; end

  ARRIVAL_FLIGHT_TYPE   = 'arrivals'
  DEPARTURE_FLIGHT_TYPE = 'departures'

  TIME_REGEX  = /^([0-1][0-9]|2[0-3]):[0-5][0-9]$/
  TIME_PARAMS = [:date, :time]

  PARAMS_MAPPING = {
      type: :type,
      airline: :airline,
      date: :date,
      time: :time,
      flight_number: :flight_no,
      from: :arriving_from,
      destination: :destination
  }.with_indifferent_access

  def self.filter!(params)
    klass = flight_class(params[:type])
    params = sanitize(params, klass)

    validate_time!(params.slice(*TIME_PARAMS))

    flights = klass.order(:date, :time)

    params.each { |field, value| flights = flights.where(PARAMS_MAPPING[field] => value) }

    flights
  end

  private

  def self.invalid_flight_type?(type)
    !type.in? [ARRIVAL_FLIGHT_TYPE, DEPARTURE_FLIGHT_TYPE]
  end

  def self.flight_class(type)
    type == ARRIVAL_FLIGHT_TYPE ? Arrival : Departure
  end

  def self.sanitize(params, klass)
    params = params.with_indifferent_access
    params.compact!
    params.delete(:type)

    return params.except(:destination) if klass == Arrival
    params.except(:arriving_from)
  end

  def self.validate_time!(params)
    return if params.empty?

    errors = []
    errors << :time if params[:time] && !params[:time] =~ TIME_REGEX
    if params[:date]
      date = params[:date].to_date rescue nil
      errors << :date unless date
    end

    raise Flights::InvalidParamsError.new("Invalid params: #{errors.join(', ')}") if errors.present?
  end
end
