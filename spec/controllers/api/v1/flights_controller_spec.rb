require 'rails_helper'

RSpec.describe Api::V1::FlightsController do
	context "Get flights" do
		it "returns success" do
			get :index

			expect(response).to have_http_status(:success)

			json_response = JSON.parse(response.body)

			expect(json_response['departures']).to be_present
			expect(json_response['arrivals']).to be_present
		end
	end

	context "Filter arrivals" do
		before(:each) do
			@filter ||= {
				end_date: Date.today.to_s(:db),
				start_date: Date.today.to_s(:db),
				airline: 'SAS',
				arriving_from: 'CHINA',
				flight_no: 'sk'
			}

			cached ||= get(:index, params: { filter: @filter, type: :arrival })

			@json_response ||= JSON.parse(cached.body)
		end

		it "responding" do
			expect(@json_response['departures']).to be_nil
			expect(@json_response['arrivals']).to be_present
		end

		it "dates filter" do
			does_dates_applied = @json_response['arrivals'].map { |arrival| arrival['date'] == @filter[:start_date] }.all?

			expect(does_dates_applied).to be_truthy
		end

		it "airline" do
			does_airline_applied = @json_response['arrivals'].map do |arrival|
				arrival['airline'].downcase.include? @filter[:airline].downcase
			end.all?

			expect(does_airline_applied).to be_truthy
		end

		it "arriving from" do
			does_ariving_from_applied = @json_response['arrivals'].map do |arrival|
				arrival['arriving_from'].downcase.include? @filter[:arriving_from].downcase
			end.all?

			expect(does_ariving_from_applied).to be_truthy
		end

		it "flight number" do
			does_flight_no_applied = @json_response['arrivals'].map do |arrival|
				arrival['flight_no'].downcase.include? @filter[:flight_no].downcase
			end.all?

			expect(does_flight_no_applied).to be_truthy
		end
	end

	context "Filter departures" do
		before(:each) do
			@filter ||= {
				end_date: '2018-10-19',
				start_date: '2018-10-19',
				airline: 'SAS',
				destination: 'CHINA',
				flight_no: 'sk'
			}

			cached ||= get(:index, params: { filter: @filter, type: :departure })

			@json_response ||= JSON.parse(cached.body)
		end

		it "responding" do
			expect(@json_response['departures']).to be_present
			expect(@json_response['arrivals']).to be_nil
		end

		it "dates filter" do
			does_dates_applied = @json_response['departures'].map { |arrival| arrival['date'] == @filter[:start_date] }.all?

			expect(does_dates_applied).to be_truthy
		end

		it "airline" do
			does_airline_applied = @json_response['departures'].map do |arrival|
				arrival['airline'].downcase.include? @filter[:airline].downcase
			end.all?

			expect(does_airline_applied).to be_truthy
		end

		it "destination from" do
			does_destination_applied = @json_response['departures'].map do |arrival|
				arrival['destination'].downcase.include? @filter[:destination].downcase
			end.all?

			expect(does_destination_applied).to be_truthy
		end

		it "flight number" do
			does_flight_no_applied = @json_response['departures'].map do |arrival|
				arrival['flight_no'].downcase.include? @filter[:flight_no].downcase
			end.all?

			expect(does_flight_no_applied).to be_truthy
		end
	end

	[:departure, :arrival].each do |flight_type|
		context "#{flight_type.to_s.humanize} time filtering" do
			it "from 10:00 to 20:00" do
				time_filter = { from_time: '10:00', till_time: '20:00' }
				get :index, params: { type: flight_type, filter: time_filter }

				json_response = JSON.parse(response.body)

				from_time = Time.parse time_filter[:from_time]
				till_time = Time.parse time_filter[:till_time]

				flights_time = json_response[flight_type.to_s.pluralize].map do |flight|
					[flight['time'], flight['expected']]
				end

				is_time_filter_working = flights_time.map do |(time, expected)|
					is_time_fitted = if time.present?
						Time.parse(time) >= from_time && Time.parse(time) <= till_time
					end

					is_expected_fitted = if expected.present?
						Time.parse(expected) >= from_time && Time.parse(expected) <= till_time
					end

					is_time_fitted || is_expected_fitted
				end.all?

				expect(is_time_filter_working).to be_truthy
			end
		end
	end

end
