class Courses::PeopleWidget < Apotomo::Widget

  def teachers(course)
    @teachers = course.teachers
    render
  end

  def students(course)
    @students = course.students
    render
  end

end
