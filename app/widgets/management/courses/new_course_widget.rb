class Management::Courses::NewCourseWidget < Apotomo::Widget
  responds_to_event :submit
  
  helper :application
  include ApplicationHelper

  def display
    render locals: { course: Course.new}
  end

  def submit(evt)
    course = Course.new(params[:course])
    if course.save
      alert_message(:success, "Course <a href='/management/courses/#{course.id}'>#{course.full_name}</a> saved")
      update view: :display, locals: {course: Course.new}
    else
      update view: :display, locals: {course: course}
    end
  end

end
