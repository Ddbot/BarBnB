class PaymentJob < ActiveJob::Base
  queue_as :default

  def perform(cust_email, host_email, listing_id, reservation_id)
     PaymentMailer.notification_email(cust_email, host_email, reservation_id, payment_id).deliver_now
  end
end
