class Management::Users::StudentInWidget < Apotomo::Widget

  responds_to_event :activate_add_mode
  responds_to_event :activate_remove_mode
  responds_to_event :add_as_student
  responds_to_event :remove
  responds_to_event :done
  
  responds_to_event :activate_remove_mode, passing: :user_panel, from: :teacher_in, with: :done
  responds_to_event :activate_add_mode, passing: :user_panel, from: :teacher_in, with: :done

  helper :application
  include ApplicationHelper

  def display(user)
    render locals: {user: user}
  end

  def done(evt)
    update({state: :display}, User.find(evt[:user_id]))
  end

  def activate_add_mode(evt)
    user = User.find(evt[:user_id])
    courses = Course.where(:_id.nin => user.student_in_ids + user.teacher_in_ids)
    update view: :add_mode, locals: {user: user, candidates: candidates(courses)}
  end

  def add_as_student(evt)
    user = User.find(evt[:user_id])
    course = Course.find(evt[:course_id])
    course.students << user
    if course.save
      alert_message(:success, "Added <a href='/management/users/#{user.id}'>#{user.name}</a> as a student in <a href='/management/courses/#{course.id}'>#{course.full_name}</a>")
      render({state: :activate_add_mode}, evt)
    else
      alert_message(:success, "Something didn't work as expected. Reload the page and try again.")
      render({state: :activate_add_mode}, evt)
    end
  end
  
  def activate_remove_mode(evt)
    user = User.find(evt[:user_id])
    courses = user.student_in
    update view: :remove_mode, locals: {user: user, candidates: candidates(courses)}
  end
  
  def remove(evt)
    user = User.find(evt[:user_id])
    course = Course.find(evt[:course_id])
    course.students.delete(user)
    if course.save
      alert_message(:success, "Removed <a href='/management/users/#{user.id}'>#{user.name}</a> from <a href='/management/courses/#{course.id}'>#{course.full_name}</a>")
      render({state: :activate_remove_mode}, evt)
    else
      alert_message(:success, "Something didn't work as expected. Reload the page and try again.")
      render({state: :activate_remove_mode}, evt)
    end
  end
  
  def candidates(courses=[])
    courses.collect { |course| {'course_id' => course.id, 'value' => course.full_name} }
  end

end
