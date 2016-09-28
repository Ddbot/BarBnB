class ListingJob < ActiveJob::Base
  queue_as :default 

  def perform(host_email, listing_id)
     ListingMailer.notification_email(host_email, listing_id).deliver_now
  end
end