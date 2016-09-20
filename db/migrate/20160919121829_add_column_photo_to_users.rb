class AddColumnPhotoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :photo, :string
  end
end