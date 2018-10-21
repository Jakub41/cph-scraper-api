require 'nokogiri'
require 'pry'
require 'json'
require 'date'
require 'open-uri'

class ScraperCphService
  attr_reader :date

  CPH_ARRIVALS_URL = 'https://www.cph.dk/en/flight-information/arrivals'.freeze
  CPH_DEPARTURES_URL = 'https://www.cph.dk/en/flight-information/departures'.freeze

  def initialize
    @date = Date.current
  end

  def execute
    set_departures_for_2_days
    set_arrivals_for_2_days
  end

  private

  def set_departures_for_2_days
    Flight.departures.delete_all
    set_departures(CPH_DEPARTURES_URL, date)
    set_departures(CPH_DEPARTURES_URL, date + 1)
  end

  def set_arrivals_for_2_days
    Flight.arrivals.delete_all
    set_arrivals(CPH_ARRIVALS_URL, date)
    set_arrivals(CPH_ARRIVALS_URL, date + 1)
  end

  def set_departures(url, date_param)
    parse_page = Nokogiri::HTML(open(url + "?date=#{date_param}")) rescue nil
    return if parse_page.nil?

    data_rows = parse_page.css('.stylish-table__row--body')
    data_rows.each do |row|
      Flight.create(
          is_arrival:  0,
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
      Flight.create(
          is_arrival:    1,
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
