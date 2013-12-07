require 'CSV'

class RentHistory

  def self.data_for_area(area)
    all_data = CSV.read("data/mean-rents-by-ta.csv")

    raise all_data.inspect
  end

end