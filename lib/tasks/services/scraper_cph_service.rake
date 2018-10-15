namespace :flights do
  namespace :set_departures_and_arrivals do
    desc 'Fetch data from CPH and set departures and arrivals'
    task set_data: :environment do
      scraper = ScraperCphService.new
      scraper.execute
    end
  end
end
