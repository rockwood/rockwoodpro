class Piece < ActiveRecord::Base
  belongs_to :recording

  validates :filetype, :recording, presence: true

  def base_url
    "http://s3.amazonaws.com/#{ENV['S3_BUCKET']}"
  end

  def file_url
    return nil unless filename.present? && recording.directory.present?
    [base_url, recording.directory, filename].join('/')
  end
end