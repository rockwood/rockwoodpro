require 'spec_helper'

feature 'Authenticating', js: true do
  scenario 'signing in with an existing user' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.sign_in(existing_user)
    expect(sign_in_page).to be_successful
  end

  scenario 'signing in with a non existing user' do
    non_existing_user = FactoryGirl.build(:user)
    sign_in_page.sign_in(non_existing_user)
    expect(sign_in_page).to_not be_successful
  end

  scenario 'signing in when already signed in' do
    existing_user = FactoryGirl.create(:user)
    sign_in_page.sign_in(existing_user)
    sign_in_page.visit_page
    expect(page.current_path).to_not eq("/")
  end

  scenario 'siging out' do
    sign_in
    visit "/sign_out"
    expect(page).to have_content("See ya later")
  end

  scenario 'trying to access a secure path' do
    visit "/app/recording/new"
    eventually do
      expect(page.current_path).to eq("/")
      expect(page).to have_content("Please sign in")
    end
  end
end
