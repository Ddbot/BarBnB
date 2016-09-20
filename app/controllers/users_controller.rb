class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]
  def show
  	return set_user
  end

  def index
    @user = User.all 
  end

  def create

  end

  def edit

    return set_user

  end

  def update
    if @user.save
      session[:msg] = nil
      redirect_to '/users/:id'
    else 
      # Only session[:msg] can pass errors to next page! so it passes questions error if not saved
      session[:msg] = question.errors.full_messages 
      redirect "/users/#{user.id}/edit" 
    end    
  end


    private
  # The following method is called strong params see google
  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname)
  end

  def set_user
    @user = User.find(params[:id])
  end


# CREATE PART BELONGING TO CLEARANCE. CANNOT RENAME IT AND MUST BE IN PRIVATE
  # private 

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
