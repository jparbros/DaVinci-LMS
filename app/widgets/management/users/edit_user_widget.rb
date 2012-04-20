class Management::Users::EditUserWidget < Apotomo::Widget
  responds_to_event :submit

  helper :application
  include ApplicationHelper


  def display(user)
    render locals: {user: user}
  end

  def submit(evt)
    user = User.find(evt[:user_id])
    if user.update_attributes(evt[:user])
      link = view_context.link_to user.name, management_user_path(user.id)
      alert_message(:success, t(:user_edited, link: link))
      update view: :display, locals: {user: user}
    else
      update view: :display, locals: {user: user}
    end
  end

end
