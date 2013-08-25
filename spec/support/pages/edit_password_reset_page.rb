class EditPasswordResetPage
  include Capybara::DSL

  def visit_page(token)
    visit "/password_resets/#{token}/edit/"
  end

  def submit_form(user)
    fill_in 'New password', with: user.email
    fill_in 'Confirm new password', with: user.email
    click_on "Reset Password"
  end

  def successful?
    page.has_content?("Congratulations! Your password has been reset")
  end

  def edit(user)
    visit_page(user.password_reset_token)
    submit_form(user)
  end
end