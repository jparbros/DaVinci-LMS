if ENV['GMAIL_USERNAME'] and ENV['GMAIL_PASSWORD']
  
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => '587',
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PASSWORD'],
    :authentication       => :plain,
    :domain               => ENV['DOMAIN_NAME'],
    :enable_starttls_auto => true }
    
  ActionMailer::Base.delivery_method = :smtp
  
elsif ENV['SENDGRID_USERNAME']
    
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,    
    :domain         => 'heroku.com'}

  ActionMailer::Base.delivery_method = :smtp
end