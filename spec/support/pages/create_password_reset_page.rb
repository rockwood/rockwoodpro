class CreatePasswordResetPage
  include Capybara::DSL

  def visit_page
    visit '/password_resets/new'
  end

  def submit_form(user)
    fill_in 'Email', with: user.email
    click_on "Reset Password"
  end

  def successful?
    page.has_content?("Password reset sent to: ")
  end

  def create(user)
    visit_page
    submit_form(user)
  end
end