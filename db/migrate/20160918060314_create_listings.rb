class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.string :location
      t.string :description
      t.float :price_per_night, null: false
      t.string :photo
      t.integer :nb_room
      t.boolean :issmoker, default: false
      t.boolean :ispetfriendly, default: false
      t.boolean :haslatecheckout
      t.boolean :haskitchen
      t.boolean :haswifi
      t.boolean :hasswimmingpool
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
