class UserMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'

  def password_reset(user)
    @user = user
    @password_reset_url = edit_password_reset_url(@user.password_reset_token)
    mail(to: @user.email, subject: 'Rockwood Productions - Password Reset')
  end

  def requested_recording(recording)
    @user = recording.user
    mail(to: @user.email, subject: 'Rockwood Productions - Recording Request')
  end

  def confirmed_recording(recording)
    @user = recording.user
    mail(to: @user.email, subject: 'Rockwood Productions - Recording Confirmation')
  end

  def finished_recording(recording)
    @user = recording.user
    mail(to: @user.email, subject: 'Rockwood Productions - Recording Finished')
  end
end