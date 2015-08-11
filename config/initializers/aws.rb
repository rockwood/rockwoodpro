Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV.fetch('S3_KEY'), ENV.fetch('S3_SECRET')),
})
