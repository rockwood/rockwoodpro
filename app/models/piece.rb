class Piece < ActiveRecord::Base
  belongs_to :recording

  validates :recording, presence: true
  validates :filename, uniqueness: { scope: :recording, message: "No duplicate files, please" }

  default_scope { order(filetype: :desc, filename: :asc) }

  def base_url
    ENV.fetch("CDN_ROOT")
  end

  def file_url
    return nil unless filename.present? && recording.directory.present?
    File.join(base_url, recording.directory, filename)
  end

  def self.from_filename(filename)
    new(filename: filename, filetype: FileParser.new(filename).filetype)
  end
end
