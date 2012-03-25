class Management::Users::NewUserWidget < Apotomo::Widget
  responds_to_event :submit
  helper :application

  def display
    render locals: {user: User.new}
  end
  
  def submit(evt)
    user = User.new(evt[:user])
    if user.save
      @message = "User <a href='/management/users/#{user.id}'>#{user.name}</a> saved! "
      update :view => :display, locals: {user: User.new}
    else
      update :view => :display, locals: {user: user}
    end
  end

end
