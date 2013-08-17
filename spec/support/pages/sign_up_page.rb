class SignUpPage
  include Capybara::DSL

  def visit_page
    visit '/sign_up'
  end

  def fill_form
    fill_in 'First name', with: 'Lester'
    fill_in 'Last name', with: 'McTester'
    fill_in 'Email', with: 'tester@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
  end

  def submit_form
    click_on 'Sign up!'
  end

  def successful?
    page.current_path == '/' && page.has_content?("Welcome to Rockwood Productions")
  end
end

