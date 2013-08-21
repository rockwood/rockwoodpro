class S3Object < AWS::S3::S3Object
  set_current_bucket_to ENV.fetch('S3_BUCKET')
end
