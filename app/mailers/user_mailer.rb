class UserMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'
  add_template_helper(ApplicationHelper)

  def recording_requested(recording)
    @recording = recording
    mail(to: @recording.user.email, subject: "Rockwood Productions - Your Recording")
  end

  def password_reset(user)
    @user = user
    @password_reset_url = edit_password_reset_url(@user.password_reset_token)
    mail(to: @user.email, subject: 'Rockwood Productions - Password Reset')
  end

  def from_mail_template(mail_template)
    mail(to: mail_template.to, subject: mail_template.subject) do |format|
      format.text { render plain: mail_template.body }
      format.html { render html: mail_template.body_html.html_safe }
    end
  end
end
