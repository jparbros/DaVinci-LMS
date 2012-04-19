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
      link = view_context.link_to course.full_name, management_course_path(course.id)
      alert_message(:success, t(:course_created, link: link))            
      update view: :display, locals: {course: Course.new}
    else
      update view: :display, locals: {course: course}
    end
  end

end
