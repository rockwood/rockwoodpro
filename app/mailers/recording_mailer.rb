class RecordingMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com', subject: 'Rockwood Productions - Your Recording'
  add_template_helper(ApplicationHelper)

  def requested(recording)
    @recording = recording
    mail(to: @recording.user.email)
  end

  def confirmed(recording)
    @recording = recording
    mail(to: @recording.user.email)
  end

  def finished(recording)
    @recording = recording
    mail(to: @recording.user.email)
  end
end
