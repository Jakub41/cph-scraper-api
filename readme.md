# Copenhagen's Flights Scraper API & Client

The project is about scraping flights informetion from the [cph.com](http://www.cph.com) site and show that informations to the users. The project scrapes the data from the Arrivals/Departures flights tables.

The projects is divided in 2 parts:
1) [A Ruby on Rails API](#The-API)
2) [A ReactJS Client](#the-client)

## The API
*The API* scope is that to scrape the flights information from the Copenhagen Airport site and store those information in a database. 
The application also expose the information scraped by end-points where a consumer client can retrieve the requested data.
#### Technology Used
- Ruby 2.5.1
- Rails 5.2.1
- PostgresSQL

#### Gems Used
- *[Nokogiri](https://github.com/sparklemotion/nokogiri)* is used to get by CSS/Xpath the right information from the original site
- *[JSON](http://flori.github.io/json/)* is used to it's specifications
- *[Whenever](https://github.com/javan/whenever)* is used to schedule in a easy why cron jobs for run automated tasks
- *[Date](https://github.com/ruby/date)* is used to easily handles date
**For Development & test:**
- *[rspec-rails](https://github.com/rspec/rspec-rails)* is used to testing the application
- *[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)* is used to clean the database
- *[foreman](https://github.com/ddollar/foreman)* is used to run the apllication using a procfile
- *[pry](https://github.com/pry/pry)* is used as alternatives to IRB console
- *[rails_db_info](https://github.com/vlado/rails_db_info)* is used to visualize a preview of the database in the browser `localhost:PORT/rails/info/db`

#### How To 
**Requirments:**
Have installed on your machine **Ruby 2.5.1**, **Rails 5.2.1** and **PostgreSQL**

**Up and Running:**
1) Clone the repo where you desire
2) From the root run `Bundle or bundle install`
3) For DB before creation be sure under `config/db` the settings are as per yours DB
4) Create DB `rake db:create`
5) Perform migrations `rake db:migrations`
6) Scrape first info to DB `rake flights:set_departures_and_arrivals:set_data` this command start a rake task which will scrape the info from the site and populate the database
7) Start the server `rails s -p 3001` or you can use `rake start` the difference is that this command will start also ReactJS client part 

**Cron Jobs:**
For be able to satrt the automated task for scraping the info you need to run the next commands
1) `whenever`
2) `whenever --update-crontab --set environment='development'` 
3) `crontab -l` 

This cron jobs is setted to scrpae the site every 5 min and add new data to the DB and have the new info coming from the cph airport.

For modify the scheduled time go to `config/schedule.rb`

#### The End Points
The next examples of the end-points can be used to see the data:
```
http://localhost:3001/api/v1/flights/departures?time=06:00
http://localhost:3001/api/v1/flights/departures?airline=SAS&time=06:00
http://localhost:3001/api/v1/flights/departures?airline=SAS&time=06:00&date=2018-10-21
http://localhost:3001/api/v1/flights/departures?airline=SAS&time=06:00&date=2018-10-21&flight_number=SK2807
http://localhost:3001/api/v1/flights/departures?airline=SAS&time=06:00&date=2018-10-21&flight_number=SK2807&destination=Malaga, Spain - Malaga Airport
```

## The Client

The front-end part is done by using ReactJS and the scope is that to show to the user the data scraped by the API part. The user is able to have detailed information about arrivals and departures from the cph airport and has also the possibility to make a search to find a desired flight.

#### Packagaes Used
- *[Axios](https://www.npmjs.com/package/axios)* is used to make the requests to the API
- *[Bootstrap 4](https://www.npmjs.com/package/bootstrap)* is used for the UI
- *[Classnames](https://www.npmjs.com/package/classnames)* is used to join class names
- *[Redux](https://www.npmjs.com/package/redux)* and it's dependencies are used to improve consistency
- *[Redux Saga](https://www.npmjs.com/package/redux-saga)* is used to handle the data fetching

#### Run It
1) Go to the folder `cph_flights_client`
2) Run the command `yarn install`
3) Start the server `yarn start` or use `rake start` to run both API and Client in the same time

