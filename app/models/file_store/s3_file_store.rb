class FileStore
  class S3FileStore
    def initialize(client = Aws::S3::Client.new)
      @client = client
    end

    def write_file(path, content)
      bucket.put_object(key: path, body: content)
    end

    def list_directory(path)
      if path.last != "/"
        path = path + "/"
      end

      bucket.objects(prefix: path).map { |o| o.key.gsub(path, "") }.reject { |f| f == "" }
    end

    private

    def bucket
      @bucket ||= Aws::S3::Resource.new(client: @client).bucket(ENV.fetch('S3_BUCKET'))
    end
  end
end
