class Management::LanguageWidget < Apotomo::Widget
  responds_to_event :change_language
  
  def display
    render
  end
  
  def change_language(evt)
    locale = evt[:locale]
    current_user = options[:current_user]
    current_user.update_attributes(language: locale)
    redirect_to root_path(locale: locale)
  end

end
