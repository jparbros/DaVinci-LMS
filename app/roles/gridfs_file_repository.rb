module GridfsFileRepository
  
  def add_file(file)
    grid = Mongo::Grid.new(Mongoid.database)
    self.uploads << grid.put(file, :filename => file.original_filename, :content_type => file.content_type)
    self.save
  end
  
  def uploaded_files
    grid = Mongo::Grid.new(Mongoid.database)
    self.uploads.map.each{ |file| grid.get(file) }.sort_by &:filename
  end
  
  def destroy_file(file)
    grid = Mongo::Grid.new(Mongoid.database)
    grid.delete(file)
    self.uploads.delete(file)
    self.save    
  end
  
end