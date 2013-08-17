require 'spec_helper'

feature 'Sign up' do
  let(:sign_up_page){ SignUpPage.new }

  scenario 'with a valid user' do
    valid_user = FactoryGirl.build(:user)
    sign_up_page.visit_page
    sign_up_page.fill_form(valid_user)
    sign_up_page.submit_form
    sign_up_page.should be_successful
  end

  scenario 'with an invalid user' do
    invalid_user = FactoryGirl.build(:user, password: "")
    sign_up_page.visit_page
    sign_up_page.fill_form(invalid_user)
    sign_up_page.submit_form
    sign_up_page.should_not be_successful
  end
end
