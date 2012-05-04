class Courses::GradesWidget < Apotomo::Widget

  def display(course)
    render locals: {course: course}
  end

end
