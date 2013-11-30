require 'spec_helper'

feature 'Sign in' do
  let(:sign_in_page){ SignInPage.new }

  scenario 'with an existing user' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.sign_in(existing_user)
    expect(sign_in_page).to be_successful
  end

  scenario 'with a non existing user' do
    non_existing_user = FactoryGirl.build(:user)
    sign_in_page.sign_in(non_existing_user)
    expect(sign_in_page).to_not be_successful
  end

  scenario 'when already signed in' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.sign_in(existing_user)
    sign_in_page.visit_page
    expect(page.current_path).to eq("/app")
  end
end

