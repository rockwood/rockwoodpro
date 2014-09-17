module ApplicationHelper
  def ember_recording_url(recording)
    "#{app_url}#/recordings/#{recording.id}"
  end

  def demo_recording
    @demo_recording ||= Recording.find_by(demo: true)
  end

  def shared_recording_path(recording)
    "#{app_path}/recording/#{demo_recording.id}/shared"
  end
end
