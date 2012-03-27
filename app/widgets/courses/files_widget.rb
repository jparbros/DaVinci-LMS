class Courses::FilesWidget < Apotomo::Widget
  responds_to_event :remove

  def display(course, current_user)
    if current_user.student?(course)
      render view: :display_student, locals: {course: course, current_user: current_user}
    else
      render view: :display_teacher, locals: {course: course, current_user: current_user}
    end
  end
  
  def files(course, current_user)
    course.extend GridfsFileRepository
    if current_user.student?(course)            
      render view: :files_student, locals: {course: course, files: course.uploaded_files}
    else
      render view: :files_teacher, locals: {course: course, files: course.uploaded_files}
    end
  end
  
  def remove(evt)
    current_user = options[:current_user]
    course = current_user.teacher_in.find(evt[:course_id])
    RemoveUploadContext.call(course, BSON::ObjectId(evt[:file_id]))
    update({state: :display}, course, current_user)      
  end

end
