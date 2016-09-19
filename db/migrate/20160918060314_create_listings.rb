class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.string :location
      t.string :description
      t.float :price_per_night, null: false
      t.string :photo
      t.integer :nb_rooms
      t.boolean :isSmoker, default: false
      t.boolean :isPetFriendly, default: false
      t.boolean :hasLatecheckout
      t.boolean :hasKitchen
      t.boolean :hasWifi
      t.boolean :hasSwimmingPool
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
