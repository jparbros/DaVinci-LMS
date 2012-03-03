class User
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps::Updated
  
  field :first_name, type: String
  field :last_name, type: String
  field :dni, type: String
  field :email, type: String
    
  validates :dni, :presence => true

  search_in :first_name, :last_name, :dni, :email
  
end
