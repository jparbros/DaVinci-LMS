class Submissions::SubmissionPanelWidget < Apotomo::Widget
  helper :application  
  
  has_widgets do |root|
    root << widget('submissions/submission', :submission, user: options[:user])
  end

  def display(user, course, submission)
    @user= user
    @course = course
    @submission = submission
    @task = @submission.task
    render
  end

  def breadcrumb(user, course, submission, task)
    if user.teacher?(course)
      render :view => :breadcrumb_teacher,
      :locals => {course: course, submission: submission, task: task}
    else
      render :view => :breadcrumb_student,
      :locals => {course: course, submission: submission, task: task}
    end
  end

  def task(task)
    render :view => :task, :locals => {:task => task}
  end
end
