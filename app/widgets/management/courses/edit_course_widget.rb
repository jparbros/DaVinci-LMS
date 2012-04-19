class Management::Courses::EditCourseWidget < Apotomo::Widget
  responds_to_event :submit

  helper :application
  include ApplicationHelper

  def display(course)
    render locals: {course: course}
  end

  def submit(evt)
    course = Course.find(evt[:course_id])
    if course.update_attributes(evt[:course])
      link = view_context.link_to course.full_name, management_course_path(course.id)
      alert_message(:success, t(:course_edited, link: link))
      update view: :display, locals: {course: course}
    else
      update view: :display, locals: {course: course}
    end
  end
end
