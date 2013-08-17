class SignInPage
  include Capybara::DSL

  def visit_page
    visit '/'
  end

  def fill_form(user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end

  def submit_form
    click_on 'Sign in now'
  end

  def successful?
    page.current_path == '/' && page.has_content?("Welcome back!")
  end
end

