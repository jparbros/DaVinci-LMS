class Courses::FilesWidget < Apotomo::Widget
  responds_to_event :remove

  def display(course, current_user)
    if current_user.student?(course)
      render :view => :display_student, locals: {course: course, current_user: current_user}
    else
      render :view => :display_teacher, locals: {course: course, current_user: current_user}
    end
  end
  
  def files(course, current_user)
    if current_user.student?(course)
      render :view => :files_student, locals: {course: course}
    else
      render :view => :files_teacher, locals: {course: course}
    end
  end
  
  def remove(evt)
    current_user = options[:current_user]
    course = current_user.teacher_in.find(evt[:course_id])
    file = course.uploads.find(evt[:file_id])
    if file
      delete_file(course, BSON::ObjectId(evt[:file_id]))
      course.save
      update({:state => :display}, course, current_user)
    else
      render :text => ''
    end   
  end
  
  private

    def delete_file(course, file)
      grid = Mongo::Grid.new(Mongoid.database)
      grid.delete(file)
      course.uploads.delete(file)
    end

end
