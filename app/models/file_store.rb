class FileStore
  def initialize
    @service = AWS::S3.new(s3_credentials)
  end

  def write_file(path, content)
    objects[path].write(content)
  end

  def list_directory(path)
    path = "#{path}/" unless path[-1,1] == "/"
    objects.with_prefix(path).collect{ |obj| obj.sub(path, '') }
  end

  private

  def objects
    @service.buckets[ENV.fetch('S3_BUCKET')].objects
  end

  def s3_credentials
    {
      access_key_id: ENV.fetch('S3_KEY'),
      secret_access_key: ENV.fetch('S3_SECRET')
    }
  end
end
