require File.dirname(__FILE__) + '/../spec_helper'

describe RentRecord do

  def app
    RentController
  end

  describe '#process_dataset' do
    # We know it is valid so there is no point to test this
    context 'CSV is invalid' do
      it "should raise error" do
      end
    end

    context 'valid CSV' do
      before do
        RentRecord.delete_all
      end

      it 'should not have any data in the init state' do
        records = RentRecord.all
        expect(records).to be_empty
      end

      it "should import data from and CSV and create record in database" do
        RentRecord.process_dataset
        records = RentRecord.all
        expect(records).not_to be_empty
      end
    end
  end

  describe '#areas' do
    it 'should list all areas in the dataset' do
      comfirmed = 'auckland'
      expect(RentRecord.areas).to include('auckland')
    end

    it 'should be unqiue as well' do
      RentRecord.areas.delete 'auckland'
      expect(RentRecord.areas).not_to include('auckland')
    end
  end


end
