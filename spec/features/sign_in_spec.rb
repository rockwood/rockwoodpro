require 'spec_helper'

feature 'Sign in' do
  scenario 'via the sign in page' do
    user = FactoryGirl.create(:user)
    sign_in_page = SignInPage.new
    sign_in_page.visit_page
    sign_in_page.fill_form(user)
    sign_in_page.submit_form
    sign_in_page.should be_successful
  end
end
