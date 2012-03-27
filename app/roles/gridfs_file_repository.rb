module GridfsFileRepository
  
  def add_file(file)
    grid = Mongo::Grid.new(Mongoid.database)
    self.uploads << grid.put(file, :filename => file.original_filename, :content_type => file.content_type)
    self.save
  end
  
end