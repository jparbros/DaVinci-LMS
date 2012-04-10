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
      alert_message(:success, "Changes in <a href='/management/users/#{user.id}'>#{user.name}</a> saved!")
      update view: :display, locals: {user: user}
    else
      update view: :display, locals: {user: user}
    end
  end

end
