class Submission
  include Mongoid::Document
    
  field :comment, type: String
  
  belongs_to :task
  belongs_to :user
  
end
