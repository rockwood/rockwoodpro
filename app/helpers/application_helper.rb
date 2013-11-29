module ApplicationHelper
  def ember_recording_url(recording)
    "#{recordings_url}#/recordings/#{recording.id}"
  end
end
