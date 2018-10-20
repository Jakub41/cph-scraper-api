require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::FlightsController, type: :controller do

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing Article & Departure attributes" do
      get :index
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match(["arrivals", "departures"])
    end

    it "response with validate airline with arrival" do
      get :index, params: {type: "arrival"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["arrivals"])
      expect(hash_body["arrivals"].first["airline"]).to eq("airline1")
    end

    it "response with validate flight_no with arrival" do
      get :index, params: {type: "arrival"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["arrivals"])
      expect(hash_body["arrivals"].first["flight_no"]).to eq("ABCD")
    end

    it "response with validate time with arrival" do
      get :index, params: {type: "arrival"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["arrivals"])
      expect(hash_body["arrivals"].first["time"]).to eq("10:00")
    end

    it "response with validate arriving_from with arrival" do
      get :index, params: {type: "arrival"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["arrivals"])
      expect(hash_body["arrivals"].first["arriving_from"]).to eq("loc1")
    end

    it "response with validate airline with departure" do
      get :index, params: {type: "departure"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["departures"])
      expect(hash_body["departures"].first["airline"]).to eq("airline2")
    end

    it "response with validate flight_no with departure" do
      get :index, params: {type: "departure"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["departures"])
      expect(hash_body["departures"].first["flight_no"]).to eq("XYZ")
    end

    it "response with validate time with departure" do
      get :index, params: {type: "departure"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["departures"])
      expect(hash_body["departures"].first["time"]).to eq("11:00")
    end

    it "response with validate destination with departure" do
      get :index, params: {type: "departure"}
      hash_body = nil
      expect(response).to have_http_status(:success)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to eq(["departures"])
      expect(hash_body["departures"].first["destination"]).to eq("loc2")
    end
  end
end