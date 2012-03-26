class Management::Courses::EditCourseWidget < Apotomo::Widget
  responds_to_event :submit
  
  helper :application
  
  def display(course)
    render locals: {course: course}
  end
  
  def submit(evt)
    course = Course.find(evt[:course_id])
    if course.update_attributes(evt[:course])
      @message = "Changes in <a href='/management/courses/#{course.id}'>#{course.full_name}</a> saved!"
      update view: :display, locals: {course: course}
    else
      update view: :display, locals: {course: course}
    end
  end
end
