require 'smarter_csv'
require 'ostruct'

class RentRecord < ActiveRecord::Base

  class << self

    # Populate the database first of all
    def process_dataset
      SmarterCSV.process("data/mean-rents-by-ta.csv", { :key_mapping => {:"date.lodged" => :date} }) do |arr|

        # Parse date string
        e = arr.first
        e[:date] = Date.strptime( e[:date], '%m/%d/%y')
        logged_date = e[:date]

        # Populate database entry
        RentRecord.transaction do
          arr.each do |hash|
            # Remove :date from this hash
            hash.delete :date

            hash.each do |key, value|
              record = self.new(logged_date: logged_date, area: key.to_s, price: value)
              record.save!
            end
          end
        end
      end
    end

    def areas
    end

  end

end
