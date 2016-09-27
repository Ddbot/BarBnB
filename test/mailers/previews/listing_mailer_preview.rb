# Preview all emails at http://localhost:3000/rails/mailers/listing_mailer
class ListingMailerPreview < ActionMailer::Preview

	def creation_listing_email
			ListingMailer.creation_listing_email(Listing.first)
	end

end
