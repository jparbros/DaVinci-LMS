class Management::Courses::CoursePanelWidget < Apotomo::Widget
  helper :application

  has_widgets do |root|
    root << widget('management/courses/edit_course', :edit_course)
    root << widget('management/courses/teachers', :teachers)
    root << widget('management/courses/students', :students)
  end

  def display(course)
    render locals: {course: course}
  end
  
end
