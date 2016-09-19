class ListingsController < ApplicationController
# This is a fast way to require someting before. See set_listing method in private folder.
  before_action :set_listing, only: [:show, :update, :edit, :destroy]
  def index
    # if signed_in?
    #   redirect_to users_path

    # end

    @listing = Listing.all
  end

  def new

    @listing = Listing.new

  end

  def create

    @listing = current_user.listings.new(listing_params)

    if @listing.save
      # I want to go to my listing show page
       redirect_to listings_path(@listing.id) # This is the way to pass in an id
    else
      redirect_to new_listing_path
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end






 # We put this in private so nobody can see the all params

  private
  # The following method is called strong params see google
  def listing_params
    params.require(:listing).permit(:title, :location, :description, :price_per_night, :nb_room, :isSmoker, :hasLatecheckout, :hasKitchen, :hasWifi, :hasSwimmingpool, :user_id)

  end

  def set_listing
    @listing = Listing.find(params[:id]) # originally listing, but I changed with Listing
 
  end

  # This prevents us to retype it for every other method
  # so i don't have  to find the listing id for show, update edit, delete and destroy


  # def show
  # @listing = Listing.find(params[:id])
  # end
  # def edit
  # @listing = Listing.find(params[:id])
  # end
  # def update
  # @listing = Listing.find(params[:id])
  # end

end
