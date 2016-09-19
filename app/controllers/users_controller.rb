class UsersController < ApplicationController
  def show
  	return set_user
  end


    private
  # The following method is called strong params see google
  def user_params
    params.require(:user).permit(:email)

  end

  def set_user
    @user = User.find(params[:id]) # originally listing, but I changed with Listing
 
  end
end
