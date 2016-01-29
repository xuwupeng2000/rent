require File.dirname(__FILE__) + '/../spec_helper'

describe RentRecord do

  def app
    RentController
  end

  describe '#all' do
    # We know it is valid so there is no point to test this
    context 'CSV is invalid' do
      it "should raise error" do
      end
    end

    context 'valid CSV' do
      before do
        @data = RentRecord.all
        @entry = @data.first
      end

      it "should retuan an array of hash" do
        expect(@data).to be_a(Array)
        expect(@entry).to be_a(Hash)
      end

      it "should parse the date string into date object" do
        date = @entry.fetch(:date)
        expect(date).to be_a(Date)
      end
    end
  end


  describe '#find' do
    context 'with matched area' do
      it "should return results" do
        # area need to be exact match eg: Auckland is not going to find the result of auckland
        results = RentRecord.find('auckland')
        expect(results).not_to be_empty
      end
    end

    context 'WITHOUT matched area' do
      it "should return empty array" do
        results = RentRecord.find('Nowhere')
        expect(results).to eq []
      end
    end
  end

end
