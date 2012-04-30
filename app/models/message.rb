class Message
  include Mongoid::Document
  
  field :contents, type: String
  field :date, type: DateTime, default: DateTime.now
  
  belongs_to :course
  
  validates :contents, presence: true
  
end
