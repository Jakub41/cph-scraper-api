require 'nokogiri'
require 'pry'
require 'json'
require 'date'
require 'open-uri'

class ScraperCphService
  attr_reader :departure_url, :arrival_url, :date

  def initialize
    @departure_url = Departure::CPH_URL
    @arrival_url = Arrival::CPH_URL
    @date = Date.current
  end

  def execute
    set_departures_for_2_days
    set_arrivals_for_2_days
  end

  private

  def set_departures_for_2_days
    Departure.delete_all
    set_departures(departure_url, date)
    set_departures(departure_url, date + 1)
  end

  def set_arrivals_for_2_days
    Arrival.delete_all
    set_arrivals(arrival_url, date)
    set_arrivals(arrival_url, date + 1)
  end

  def set_departures(url, date_param)
    parse_page = Nokogiri::HTML(open(url + "?date=#{date_param}")) rescue nil
    return if parse_page.nil?

    data_rows = parse_page.css('.stylish-table__row--body')
    data_rows.each do |row|
      Departure.create(
          date:        date_param,
          time:        row.at('.flights__table__col--time').search('span')[0]&.text,
          flight_no:   row.at('.flights__table__col--destination').css('small')&.text,
          airline:     row.css('.v--desktop-only')[1].at('span')&.text,
          expected:    row.css('.v--desktop-only')[0].at('span')&.text,
          destination: row.at('.flights__table__col--destination').css('strong')&.text,
          gate:        row.at('.flights__table__col--gate').at('span')&.text,
          terminal:    row.at('.flights__table__col--terminal').at('span')&.text,
          status:      row.css('.stylish-table__cell')[6].at('span')&.text
      )
    end
  end

  def set_arrivals(url, date_param)
    parse_page = Nokogiri::HTML(open(url + "?date=#{date_param}")) rescue nil
    return if parse_page.nil?

    data_rows = parse_page.css('.stylish-table__row--body')
    data_rows.each do |row|
      Arrival.create(
          date:          date_param,
          time:          row.at('.flights__table__col--time').search('span')[0]&.text,
          flight_no:     row.at('.flights__table__col--destination').css('small')&.text,
          airline:       row.css('.v--desktop-only')[1].at('span')&.text,
          arriving_from: row.at('.flights__table__col--destination').css('strong')&.text,
          expected:      row.css('.v--desktop-only')[0].at('span')&.text,
          gate:          row.at('.flights__table__col--gate').at('span')&.text,
          terminal:      row.at('.flights__table__col--terminal').at('span')&.text,
          status:        row.css('.stylish-table__cell')[6].at('span')&.text
      )
    end
  end

  def get_date(str)
    Date.parse(str) rescue Date.current
  end
end