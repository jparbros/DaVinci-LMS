class Submissions::SubmissionWidget < Apotomo::Widget
  responds_to_event :submit_submission
  responds_to_event :remove

  helper :application

  def display(submission)
    user = options[:user]
    course = submission.task.course
    if user.teacher?(course)
      render :view => :display_teacher, :locals => {:submission => submission}
    else
      render :view => :display, :locals => {:submission => submission, :course => course}
    end
  end

  def submit_submission(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    submission.comment = evt[:submission][:comment]
    submission.save
    @message = 'Change saved!'
    update({:state => :display}, submission)
  end

  def remove(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    file = submission.uploads.find(evt[:file_id])
    if file
      grid = Mongo::Grid.new(Mongoid.database)
      file = grid.delete(BSON::ObjectId(evt[:file_id]))
      submission.uploads.delete(BSON::ObjectId(evt[:file_id]))
      submission.save
      update({:state => :display}, submission)
    else
      render :text => ''
    end    
  end

end
