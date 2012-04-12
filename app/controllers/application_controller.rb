class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  protected
    def not_authenticated
      redirect_to :login, alert: "Please login first."
    end
    
    def require_admin_rights
      redirect_to :root unless current_user.admin?
    end
  
    def require_owner_rights
      redirect_to :root unless current_user.owner?
    end
end
