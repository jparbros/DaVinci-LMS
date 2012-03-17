class GridfsController < ActionController::Metal
  def serve
    file_name = params[:name]
    file_id = params[:id]
    begin
      gridfs_file = Mongo::Grid.new(Mongoid.database).get(BSON::ObjectId(file_id))
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end