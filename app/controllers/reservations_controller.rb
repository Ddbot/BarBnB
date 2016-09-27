class ReservationsController < ApplicationController
# This is a fast way to require someting before. See set_listing method in private folder.	
	before_action :set_reservation, only: [:update, :edit, :destroy]

	def index 
		# We don't display a list of Reservations !
  end	

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

  def create
    @listing = Listing.find(params[:listing_id])    
    @reservation = @listing.reservations.new(reservation_params)    
    @reservation.user_id = current_user.id 
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @listing.price_per_night
    @reservation.approval_status = true if @reservation.valid?
    @reservation.save unless (@reservation.approval_status === false)
    @host = "andry.developper@gmail.com" #LATER User.find(@listing.user_id).email

    if @reservation.save
    #ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_later
    # ReservationMailer to send a notification email after save
    #ReservationJob.perform_now("andry.developper@gmail.com", "andry.developper@gmail.com", 1, 1)
    ReservationJob.perform_now(current_user.email, @host, @reservation.listing.id, @reservation.id)
    # call out reservation job to perform the mail sending task after @reservation is successfully saved
    flash[:notice] = "Reservation successfully registered"      
    redirect_to listings_path     
    else 
      flash[:error] = @reservation.errors
      redirect_to new_listing_reservation_path(@listing.id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @listing = Listing.find(@reservation.listing_id)    
  end

  # def confirm_reservation

  # end
# end

private

  def reservation_params
    params[:reservation][:start_date] = Date.parse(params[:reservation][:start_date].to_s)
    params[:reservation][:end_date] = Date.parse(params[:reservation][:end_date].to_s )
    params.require(:reservation).permit(:start_date, :end_date, :total_price, :nb_guests, :price_per_night, :listing_id, :user_id, :approval_status) 
  end

  def set_reservation
    @reservation = Reservation.find(params[:listing_id])
  end
end