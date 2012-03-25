class Management::UsersController < ApplicationController
  
  has_widgets do |root|
    root << widget('management/users/new_user', :new_user)
  end
  
  def index
    @users = User.all
  end
  
  def new
    
  end
  
  def show
    
  end
  
end
