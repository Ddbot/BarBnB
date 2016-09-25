class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]


  def show 
  	return current_user
  end

  def index
    @user= User.all
  end

  def new
    @user = User.new
  end  

  def create
    @user = User.find(params[:id])
    redirect_to @user #"/users/:id"
  end

  def edit
    @user = current_user #set_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else 
      redirect edit_user_path(current_user.id)
    end    
  end


    private
  # The following method is called strong params see google
  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, {avatars:[]}) 
  end

  def set_user
    @user = User.find(params[:id])
  end


# CREATE PART BELONGING TO CLEARANCE. CANNOT RENAME IT AND MUST BE IN PRIVATE
  private 

    # def user_from_params
    #   email = user_params.delete(:email)
    #   password = user_params.delete(:password)
    #   firstname = user_params.delete(:firstname)
    #   lastname = user_params.delete(:lastname)

    #   Clearance.configuration.user_model.new(user_params).tap do |user|
    #     user.email = email
    #     user.password = password
    #     user.firstname = firstname
    #     user.lastname = lastname
    # end
  # end   
end
