require "rails_helper"

describe Flight do

  let(:company)   { Factory(:company) }

  context '.filter!' do

    let(:search_params) do
      {
          type: 'departures',
          airline: 'SAS',
          time: '03:30',
          date: '2018-06-10',
          flight_number: 'X38564',
          destination: 'Denmark'
      }
    end

    before(:all) { Flight.delete_all && create_flight }

    it 'returns records that match the search terms' do

      expect(described_class.filter!(search_params).count).to eq 1
    end
  end

  context '.invalid_flight_type?' do

    it 'return true for invalid types' do
      expect(described_class.invalid_flight_type?('arrival')).to eq true
    end

    it "returns false for 'arrivals' and 'departures'" do
      expect(described_class.invalid_flight_type?('arrivals')).to eq false
      expect(described_class.invalid_flight_type?('departures')).to eq false
    end
  end

  context '.sanitize' do

    context 'sets the correct type' do

      it 'for arrivals' do
        params = { type: 'arrivals' }
        params = described_class.sanitize(params)

        expect(params[:type]).to eq 1
      end

      it 'for departures' do
        params = { type: 'departures' }
        params = described_class.sanitize(params)

        expect(params[:type]).to eq 0
      end
    end
  end

  context '.validate_time!' do

    let(:invalid_params) { { date: '2018-13-13', time: '11:11:11'} }
    let(:valid_params) { { date: '2018-12-12', time: '11:11:11'} }

    it 'raises Flights::InvalidParamsError when invalid' do
      expect { described_class.validate_time!(invalid_params) }.to raise_error(described_class::InvalidParamsError)
    end

    it 'does not raise Flights::InvalidParamsError when valid' do
      expect { described_class.validate_time!(valid_params) }.to_not raise_error(described_class::InvalidParamsError)
    end
  end

  private

  def create_flight
    Flight.create(is_arrival: 1, date: '2018-10-06', time: '05:50', airline: 'SSA', flight_no: 'Z3243', arriving_from: 'USA')
    Flight.create(is_arrival: 0, date: '2018-06-10', time: '03:30', airline: 'SAS', flight_no: 'X38564', destination: 'Denmark')
  end
end
