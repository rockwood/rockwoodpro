AWS::S3::Base.establish_connection!(
  access_key_id: ENV.fetch('S3_KEY'),
  secret_access_key: ENV.fetch('S3_SECRET'),
)