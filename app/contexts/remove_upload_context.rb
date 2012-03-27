class RemoveUploadContext

  attr_reader :target, :file

  def self.call(target, file)
    RemoveUploadContext.new(target, file).call
  end

  def initialize(target, file)
    @target = target
    @file = file
    @target.extend GridfsFileRepository
  end

  def call
    @target.destroy_file(@file)  
  end

end