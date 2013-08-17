require 'spec_helper'

feature 'Sign up' do
  scenario 'via the sign up page' do
    sign_up_page = SignUpPage.new
    sign_up_page.visit_page
    sign_up_page.fill_form
    sign_up_page.submit_form
    sign_up_page.should be_successful
  end
end
