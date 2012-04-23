class School
  include Mongoid::Document
  
  field :name, type: String
  field :file_space_used, type: Integer, default: 0
  field :number_of_files, type: Integer, default: 0
end
