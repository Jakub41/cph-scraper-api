require 'test_helper'

class Api::V1::FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_flights_index_url
    assert_response :success
  end

  test "should get destroy_all" do
    get api_v1_flights_destroy_all_url
    assert_response :success
  end

  test "should get filter_arrivals" do
    get api_v1_flights_filter_arrivals_url
    assert_response :success
  end

  test "should get filter_departures" do
    get api_v1_flights_filter_departures_url
    assert_response :success
  end

end
