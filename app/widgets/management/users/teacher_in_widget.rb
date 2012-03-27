class Management::Users::TeacherInWidget < Apotomo::Widget
  
  responds_to_event :activate_add_mode
  responds_to_event :activate_remove_mode
  responds_to_event :add_as_teacher
  responds_to_event :remove
  responds_to_event :done

  helper :application

  def display(user)
    render locals: {user: user}
  end

  def done(evt)
    update({state: :display}, User.find(evt[:user_id]))
  end

  def activate_add_mode(evt)
    user = User.find(evt[:user_id])
    courses = Course.where(:_id.nin => user.teacher_in_ids)
    update view: :add_mode, locals: {user: user, candidates: candidates(courses)}
  end

  def add_as_teacher(evt)
    user = User.find(evt[:user_id])
    course = Course.find(evt[:course_id])
    course.teachers << user
    if course.save
      @message = "Added <a href='/management/users/#{user.id}'>#{user.name}</a> as a teacher in <a href='/management/courses/#{course.id}'>#{course.full_name}</a> "
      render({state: :activate_add_mode}, evt)
    else
      @message = "Something didn't work as expected. Reload the page and try again."
      render({state: :activate_add_mode}, evt)
    end
  end
  
  def activate_remove_mode(evt)
    user = User.find(evt[:user_id])
    courses = user.teacher_in
    update view: :remove_mode, locals: {user: user, candidates: candidates(courses)}
  end
  
  def remove(evt)
    user = User.find(evt[:user_id])
    course = Course.find(evt[:course_id])
    course.teachers.delete(user)
    if course.save
      @message = "Removed <a href='/management/users/#{user.id}'>#{user.name}</a> from <a href='/management/courses/#{course.id}'>#{course.full_name}</a>"
      render({state: :activate_remove_mode}, evt)
    else
      @message = "Something didn't work as expected. Reload the page and try again."
      render({state: :activate_remove_mode}, evt)
    end
  end
  
  def candidates(courses=[])
    courses.collect { |course| {'course_id' => course.id, 'value' => course.full_name} }
  end

end
