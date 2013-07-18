require 'CSV'

class RentHistory

  def self.data_for_area(area)
    all_data = CSV.read("data/mean-rents-by-ta.csv")

    raise all_data.inspect
    # TODO
    # return hash of rent in this format:
    # {:year => rent_amount}
    # e.g. {:2001 => 32.12, :2002 => 34.27 }
  end

end