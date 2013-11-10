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
    ENV.fetch("CDN_ROOT")
  end

  def file_url
    return nil unless filename.present? && recording.directory.present?
    File.join(base_url, recording.directory, filename)
  end
end