module ApplicationHelper
  def ember_recording_url(recording)
    "#{app_url}#/recordings/#{recording.id}"
  end

  def demo_recording
    @demo_recording ||= Recording.find_by(demo: true)
  end

  def recording_path(recording)
    "#{app_path}/recordings/#{demo_recording.id}"
  end
end
