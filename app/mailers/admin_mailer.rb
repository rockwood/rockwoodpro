class AdminMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'

  def requested_recording(admin_user, recording)
    @recording = recording
    mail(to: admin_user.email, subject: 'Rockwood Productions - Recording Request')
  end
end