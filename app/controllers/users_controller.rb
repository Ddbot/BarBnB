class UsersController < ApplicationController
  def show
  	return set_user
  end

  def index
    @user = User.all 
  end


    private
  # The following method is called strong params see google
  def user_params
    params.require(:user).permit(:email)

  end

  def set_user
    @user = User.find(params[:id])
   end
end
