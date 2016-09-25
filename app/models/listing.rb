class Listing < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  # has_many bookings
  mount_uploaders :avatars, AvatarUploader
  has_many :reservations
  belongs_to :user


end
