class FileStore
  class FakeFileStore < S3FileStore
    def initialize
      super(Aws::S3::Client.new(stub_responses: true))
    end
  end
end
