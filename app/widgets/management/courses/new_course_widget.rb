class Management::Courses::NewCourseWidget < Apotomo::Widget
  responds_to_event :submit
  helper :application

  def display
    render locals: { course: Course.new}
  end

  def submit(evt)
    course = Course.new(params[:course])
    if course.save
      @message = "Course <a href='/management/courses/#{course.id}'>#{course.full_name}</a> saved"
      update view: :display, locals: {course: Course.new}
    else
      update view: :display, locals: {course: course}
    end
  end

end
