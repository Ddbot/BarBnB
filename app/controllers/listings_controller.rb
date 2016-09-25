class ListingsController < ApplicationController
# This is a fast way to require someting before. See set_listing method in private folder.
  before_action :set_listing, only: [:show, :update, :edit, :destroy]
  def index
    listings_per_page = 10  
    params[:page] = 1 unless params[:page] 
    first_listing ||= (params[:page].to_i - 1) * listings_per_page
    listings = Listing.all 
    @nb_pages_needed = listings.count / listings_per_page
    if params[:tag]
      @listing = Listing.tagged_with(params[:tag])
    else    
      @listings = listings[first_listing...(first_listing + listings_per_page)]
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)    
    if @listing.save
      # I want to go to my listing show page
       redirect_to listing_path(@listing.id) # This is the way to pass in an id
    else
      redirect_to new_listing_path
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing.id)
    else 
      redirect edit_listing_path(@listing.id)
    end    
  end  


 # We put this in private so nobody can see the all params

  private
  # The following method is called strong params see google
  def listing_params
    params.require(:listing).permit(:title, :location, :description, :price_per_night, :photo, :nb_rooms, :isSmoker, :hasLatecheckout, :hasKitchen, :hasWifi, :hasSwimmingPool, :user_id, :isPetFriendly,{avatars:[]},:tag_list)

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
