class UserMailer < ActionMailer::Base
  default from: "noreply@#{ENV['DOMAIN_NAME']}"
  
  def register_user(user, password)
     @user = user
     @password = password
     @url  = ENV['DOMAIN_NAME']
     @school = School.first
     mail(:to => user.email, :subject => "Welcome to DaVinci LMS")
   end
end
