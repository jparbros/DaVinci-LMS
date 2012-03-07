class Home::HomePanelWidget < Apotomo::Widget
  
  cache :display do |cell, user|
    user.id.to_s + user.updated_at.to_s
  end

  def display(user)
    @courses_as_student = user.student_in
    @courses_as_teacher = user.teacher_in
    render
  end

end
