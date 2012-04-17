class UserMailer < ActionMailer::Base
  default from: "noreply@example.com"
  
  def register_user(user, password)
     @user = user
     @password = password
     @url  = ENV['domain_name']
     @school = School.first
     mail(:to => user.email, :subject => "Welcome to My Awesome Site")
   end
end
