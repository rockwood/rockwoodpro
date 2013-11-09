class Piece < ActiveRecord::Base
  VIDEO_EXTENSIONS = ["mp4", "mov", "ogg"]
  AUDIO_EXTENSIONS = ["mp3", "wav", "aiff", "aac"]

  belongs_to :recording

  validates :recording, presence: true
  validates :filename, uniqueness: { scope: :recording, message: "No duplicate files, please" }

  before_save :parse_filetype

  def parse_filetype
    if VIDEO_EXTENSIONS.include?(extension)
      return self.filetype = "video"
    elsif AUDIO_EXTENSIONS.include?(extension)
      return self.filetype = "audio"
    end
  end

  def extension
    filename.split(".").last
  end

  def base_url
    "http://s3.amazonaws.com/#{ENV.fetch('S3_BUCKET')}"
  end

  def file_url
    return nil unless filename.present? && recording.directory.present?
    [base_url, recording.directory, filename].join('/')
  end
end