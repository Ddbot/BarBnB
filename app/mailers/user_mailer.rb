class UserMailer < ApplicationMailer

# http://guides.rubyonrails.org/action_mailer_basics.html

	def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to BarBnB')
  end
  
end

