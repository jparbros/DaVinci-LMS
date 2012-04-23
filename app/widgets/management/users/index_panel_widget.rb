class Management::Users::IndexPanelWidget < Apotomo::Widget

  responds_to_event :activate_remove_mode
  responds_to_event :done
  responds_to_event :remove

  helper :application
  include ApplicationHelper

  def display(users)
    render locals: {users: users}
  end

  def activate_remove_mode(evt)
    users = User.all
    update view: :remove_mode, locals: { users: users, candidates: candidates(users)}
  end

  def remove(evt)
    user = User.find(evt[:user_id])
    if user.owner?
      alert_message(:error, t(:owner_cant_be_removed, user: user.name))
    elsif user.destroy    
      alert_message(:success, t(:user_removed, user: user.name))
    end
    trigger :activate_remove_mode
  end

  def done(evt)
    replace({:state => :display}, User.all)
  end

  private
    def candidates(users = [])
      users.map.each { |user| {'user_id' => user.id, 'value' => user.name} }
    end

end
