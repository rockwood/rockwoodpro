class AdminMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'

  def requested_recording(admin_users, recording)
    @recording = recording
    mail(to: admin_users.map(&:email), subject: 'Rockwood Productions - Recording Request')
  end
end