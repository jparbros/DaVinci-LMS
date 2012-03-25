class Management::Users::EditUserWidget < Apotomo::Widget
  responds_to_event :submit
  
  helper :application
  

  def display(user)
    render :locals => {:user => user}
  end

  def submit(evt)
    user = User.find(evt[:user_id])
    if user.update_attributes(evt[:user])      
      update :view => :display, locals: {user: user, :message => "Changes in #{user.name} saved!"}
    else
      update :view => :display, locals: {user: user}
    end
  end

end
