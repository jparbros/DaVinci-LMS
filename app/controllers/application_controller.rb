class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  def template
    @template
  end
  
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
