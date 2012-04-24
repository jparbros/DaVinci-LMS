class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  before_filter :set_locale
  
  has_widgets do |root|
    root << widget('management/language', :language, current_user: current_user)
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end    

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def template
    @template
  end
  
  protected
    def not_authenticated
      redirect_to :login, alert: "Please login first."
    end
    
    def require_admin_rights
      redirect_to :root unless current_user.admin? or current_user.owner?
    end
  
    def require_owner_rights
      redirect_to :root unless current_user.owner?
    end
end
