class Management::UsersController < ApplicationController

  has_widgets do |root|
    root << widget('management/users/new_user', :new_user)
    root << widget('management/users/user_panel', :user_panel)
  end

  def index
    @users = User.all
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end

end
