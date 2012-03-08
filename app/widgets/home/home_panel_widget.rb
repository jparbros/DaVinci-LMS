class Home::HomePanelWidget < Apotomo::Widget

  def display(user)
    @courses_as_student = user.student_in
    @courses_as_teacher = user.teacher_in
    render
  end

end
