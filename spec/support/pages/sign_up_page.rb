class SignUpPage
  include Capybara::DSL

  def visit_page
    visit '/sign_up'
  end

  def fill_form(user)
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Confirm password', with: user.password
  end

  def submit_form
    click_on 'Sign up!'
  end

  def successful?
    page.current_path == '/' && page.has_content?("Welcome to Rockwood Productions")
  end
end

