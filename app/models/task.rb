class Task
  include Mongoid::Document
  
  field :description, type: String
  field :title, type: String
  
  belongs_to :course
end
