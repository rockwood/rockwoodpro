class Mailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'

  def from_mail_template(mail_template)
    mail(to: mail_template.to, subject: mail_template.subject) do |format|
      format.text { render plain: mail_template.body }
      format.html { render html: mail_template.body_html.html_safe }
    end
  end
end
