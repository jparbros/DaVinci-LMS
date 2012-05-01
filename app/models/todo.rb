class Todo
  include Mongoid::Document
  
  field :content, type: String
  
  belongs_to :user
  belongs_to :course
  
  validates :content, presence: true    
  
end
