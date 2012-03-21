class Courses::FilesWidget < Apotomo::Widget
  responds_to_event :new_file

  def display(course, current_user)
    if current_user.student?(course)
      render :view => :display_student, locals: {course: course}
    else
      render :view => :display_teacher, locals: {course: course}
    end
  end
  
  def new_file(evt)    
    update "#new_file", :view => "new_file_form", :locals => {:course => Course.find(evt[:course_id])}
  end
  
  def files(course)
    render :view => :files, locals: {course: course}
  end

end
