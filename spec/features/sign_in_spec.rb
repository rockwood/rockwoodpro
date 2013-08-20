require 'spec_helper'

feature 'Sign in' do
  let(:sign_in_page){ SignInPage.new }

  scenario 'with an existing user' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.visit_page
    sign_in_page.fill_form(existing_user)
    sign_in_page.submit_form
    sign_in_page.should be_successful
  end

  scenario 'with a non existing user' do
    non_existing_user = FactoryGirl.build(:user)
    sign_in_page.visit_page
    sign_in_page.fill_form(non_existing_user)
    sign_in_page.submit_form
    sign_in_page.should_not be_successful
  end

  scenario 'when already signed in' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.sign_in(existing_user)
    sign_in_page.visit_page
    page.current_path.should == "/recordings"
  end
end

