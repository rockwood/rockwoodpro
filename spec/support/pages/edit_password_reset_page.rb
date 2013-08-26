class EditPasswordResetPage
  include Capybara::DSL

  def visit_page(token)
    visit "/password_resets/#{token}/edit/"
  end

  def submit_form(new_password)
    fill_in "New password", with: new_password
    fill_in "Confirm new password", with: new_password
    click_on "Reset Password"
  end

  def successful?
    page.has_content?("Your password has been reset")
  end

  def unsuccessful?
    page.has_content?("Reset token is incorrect or has expired")
  end

  def edit(user, new_password)
    visit_page(user.password_reset_token)
    submit_form(new_password)
  end
end