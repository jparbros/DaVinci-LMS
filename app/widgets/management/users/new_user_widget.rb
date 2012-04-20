class Management::Users::NewUserWidget < Apotomo::Widget
  responds_to_event :submit
  
  helper :application
  include ApplicationHelper

  def display
    render locals: {user: User.new}
  end
  
  def submit(evt)   
    evt[:user][:password] = Forgery(:basic).password(:at_least => 9, :at_most => 9)
    user = User.new(evt[:user])
    if user.save
      UserMailer.register_user(user, evt[:user][:password]).deliver
      link = view_context.link_to user.name, management_user_path(user.id)
      alert_message(:success, t(:user_created, link: link))
      update view: :display, locals: {user: User.new}
    else
      update view: :display, locals: {user: user}
    end
  end

end
