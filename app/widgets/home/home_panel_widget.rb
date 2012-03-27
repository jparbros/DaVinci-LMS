class Home::HomePanelWidget < Apotomo::Widget

  def display(user)
    render locals: {courses_as_student: user.student_in, courses_as_teacher: user.teacher_in}
  end

end
