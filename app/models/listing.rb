class Listing < ActiveRecord::Base

  # has_many bookings
  mount_uploaders :avatars, AvatarUploader

end
