# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

	  def notification_email_preview
	  	ReservationMailer.notification_email("cheztoi@gmail.com","andry.developper@gmail.com",1,2)
 		end

end 
