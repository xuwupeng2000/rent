require 'smarter_csv'
require 'ostruct'

class RentRecord


  class << self
    def find(area)
      process_dataset
      area = area.to_sym
      return [] unless @areas.include?(area)

      results = @data.collect do |e|
        o = OpenStruct.new(date: e[:date], price: e[area])
      end
      results.sort! {|a, b| b.date <=> a.date}
      results
    end

    def process_dataset
      return @data if @data

      @data = []

      # File is not too big no chunck size is specified
      SmarterCSV.process("data/mean-rents-by-ta.csv", { :key_mapping => {:"date.lodged" => :date} }) do |arr|
        e = arr.first
        e[:date] = Date.strptime( e[:date], '%m/%d/%y')
        # TODO: Where we can populate database
        @data << e
      end

      # Areas
      @areas = @data.first.keys
      @areas.delete(:date)

      @data
    end

    def areas
      process_dataset
      @areas
    end

  end

end
