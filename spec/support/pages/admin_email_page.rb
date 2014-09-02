class AdminEmailPage < Page
  def submit(comments=nil)
    fill_in "email_comments", with: comments
    find("input[type=submit]").click
  end
end
