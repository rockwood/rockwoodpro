class AdminEmailPage < Page
  def submit(comments=nil)
    fill_in "mail_template_body", with: comments
    find("input[type=submit]").click
  end
end
