class SessionController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  
  layout 'session'
  
  helper :application

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path(locale: current_user.language)
    else
      @message = view_context.alert_message(:error, "Login failed.")
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
