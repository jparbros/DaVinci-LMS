class Courses::CoursePanelWidget < Apotomo::Widget
  
  helper :application
  
  has_widgets do |root|
    root << widget("courses/files", :files, current_user: options[:current_user])
  end

  def display(course, current_user)    
    render view: :display, locals: {course: course, current_user: current_user}
  end
  
  def tasks(course, current_user)
    if current_user.student?(course)
      render view: :tasks_student, locals: {course: course, 
          active_submissions: active_submissions(current_user, course), 
          pending_revisions: pending_revisions(current_user, course),
          archived_submissions: archived_submissions(current_user, course)}
    else            
      render view: :tasks_teacher, locals: {course: course, 
        active_tasks: active_tasks(course), 
        pending_revision_tasks: pending_revisions_tasks(course), 
        archived_tasks: archived_tasks(course)}
    end
  end
  
  def teachers(course)
    render view: :teachers, locals: {teachers: course.teachers}
  end

  def students(course)
    render view: :students, locals: {students: course.students}
  end
  
  private
    def active_submissions(current_user, course)
      Submission.where(user_id: current_user.id, 
        :task_id.in => course.tasks.where(:last_day_to_submit.gte => Date.today).map(&:id), 
        mark: nil)
    end
    
    def archived_submissions(current_user, course)
      Submission.where(user_id: current_user.id, :task_id.in => course.tasks.map(&:id), :mark.ne => nil)
    end
    
    def pending_revisions(current_user, course)
      Submission.where(user_id: current_user.id, 
        :task_id.in => course.tasks.where(:last_day_to_submit.lt => Date.today).map(&:id), 
        mark: nil)
    end
    
    def active_tasks(course)
      course.tasks.where(:last_day_to_submit.gte => Date.today )      
    end
    
    def pending_revisions_tasks(course)
      course.tasks.where(:last_day_to_submit.lt => Date.today).select{|t| t.submissions.where(:mark => nil).present?}
    end
    
    def archived_tasks(course)
      course.tasks.where(:last_day_to_submit.lt => Date.today ).select{|t| t.submissions.where(mark: nil).empty?}
    end
end
