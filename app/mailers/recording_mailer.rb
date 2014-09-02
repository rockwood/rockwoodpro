class RecordingMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com', subject: 'Rockwood Productions - Your Recording'
  add_template_helper(ApplicationHelper)

  def requested(recording)
    @recording = recording
    mail(to: @recording.user.email)
  end

  def confirmed(recording, comments=nil)
    @recording = recording
    @comments = comments
    mail(to: @recording.user.email)
  end

  def finished(recording, comments=nil)
    @recording = recording
    @comments = comments
    mail(to: @recording.user.email)
  end
end
