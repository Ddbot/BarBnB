class RemoveColumnPhoto < ActiveRecord::Migration
  def change
  	remove_column :users, :photo, :string
  end
end


