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
      alert_message(:success, "Course #{view_context.link_to course.full_name, management_course_path(course.id)} saved")
      update view: :display, locals: {course: Course.new}
    else
      update view: :display, locals: {course: course}
    end
  end

end
