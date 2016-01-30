class CreateRentRecords < ActiveRecord::Migration
  def change
    create_table :rent_records do |t|
  		t.string :area
      t.decimal :price
      t.date :logged_date
  	end
  end
end
