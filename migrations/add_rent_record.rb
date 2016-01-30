class AddRentRecord < ActiveRecord::Migration
  def up
  	create_table :rent_records do |t|
  		t.string :area
      t.number :price
      t.date :logged_date
  	end
  end

  def down
  	drop_table :rent_records
  end
end
