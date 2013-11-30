module ApplicationHelper
  def ember_recording_url(recording)
    "#{app_url}#/recordings/#{recording.id}"
  end
end
