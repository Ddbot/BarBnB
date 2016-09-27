class ListingMailer < ApplicationMailer

	def creation_listing_email(listing)
    @listing = listing
    @url  = 'http://localhost:3000'
    mail(to: User.find(@listing.user_id).email, subject: 'You successfully added your listing to BarBnb')
  end

end

