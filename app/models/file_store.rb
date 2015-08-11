class FileStore
  class << self
    attr_accessor :current
  end

  self.current = S3FileStore.new
end

