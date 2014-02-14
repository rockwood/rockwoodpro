class FileParser
  VIDEO_EXTENSIONS = [".mp4", ".mov", ".ogg"]
  AUDIO_EXTENSIONS = [".mp3", ".wav", ".aiff", ".aac"]

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def extension
    File.extname(filename)
  end

  def filetype
    if VIDEO_EXTENSIONS.include?(extension)
      return "video"
    elsif AUDIO_EXTENSIONS.include?(extension)
      return "audio"
    end
  end
end