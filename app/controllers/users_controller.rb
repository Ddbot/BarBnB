class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]

  # http://guides.rubyonrails.org/action_mailer_basics.html


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
    respond_to do |format|
      if @user.save 
        UserMailer.welcome_email(@user).deliver_later # The method welcome_email returns an ActionMailer::MessageDelivery object which can then just be told deliver_now or deliver_later to send itself out.
        format.html { redirect_to(@user, notice: "User was successfully created.")}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



    redirect_to @user #"/users/:id"
  end

  def edit
    @user = current_user #set_user
  end

  def update
     if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else 
      redirect_to edit_user_path(current_user.id)
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
