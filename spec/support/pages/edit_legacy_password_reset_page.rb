class EditLegacyPasswordResetPage
  include Capybara::DSL

  def showing?
    current_path =~ /edit_legacy/
  end

  def submit_form(new_password)
    fill_in "New password", with: new_password
    fill_in "Confirm new password", with: new_password
    click_on "Reset Password"
  end

  def successful?
    page.has_content?("Your password has been reset")
  end
end