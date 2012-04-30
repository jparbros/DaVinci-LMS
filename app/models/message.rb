class Message
  include Mongoid::Document
  
  field :contents, type: String
  
  belongs_to :course
  
  validates :contents, presence: true
  
end
