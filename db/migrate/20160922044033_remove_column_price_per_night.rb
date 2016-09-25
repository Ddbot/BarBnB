class RemoveColumnPricePerNight < ActiveRecord::Migration
  def change
  	remove_column :reservations, :price_per_night, :float
  end
end


