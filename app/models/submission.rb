class Submission
  include Mongoid::Document
    
  field :comment, type: String
  field :uploads, type: Array, default: Array.new
  field :mark, type: String
  
  belongs_to :task
  belongs_to :user
  
  def uploads_files
    grid = Mongo::Grid.new(Mongoid.database)
    uploads.map.each do |file|
      grid.get(file)
    end.sort_by &:filename
  end
  
end
