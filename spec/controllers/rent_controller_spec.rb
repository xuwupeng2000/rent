require File.dirname(__FILE__) + '/../spec_helper'

describe RentController do

  def app
    RentController
  end

  # So we can run the tests without worry about order
  before :all do
    records = RentRecord.all
    if records.empty?
      RentRecord.process_dataset
    end
  end

  describe 'GET /' do
    it "should render 200" do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe 'POST /' do
    context 'with results' do
      it "should render template" do
        post '/', area: 'auckland'
        expect(last_response.body).to include('Auckland')
        expect(last_response.body).to include('Rent Price')
      end

      it "should render area" do
      end
    end

    context 'WITHOUT results' do
      it "should render template" do
        post '/', area: 'in the middle of nowhere'
        expect(last_response.body).to include('In the middle of nowhere')
        expect(last_response.body).to include('Sorry')
      end
    end
  end

end
