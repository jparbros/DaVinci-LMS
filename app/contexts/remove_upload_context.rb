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
    school = School.first
    school.file_space_used -= @file.size
    school.number_of_files -= 1
    school.save
  end

end