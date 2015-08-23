module ApplicationHelper
  def ember_recording_url(recording)
    "#{app_url}/recordings/#{recording.id}"
  end

  def demo_path
    "#{app_path}/recordings?demo=true"
  end
end
