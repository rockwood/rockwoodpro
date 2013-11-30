require 'spec_helper'

feature 'Sign out' do
  scenario 'when already signed in' do
    sign_in
    visit "/sign_out"
    expect(page).to have_content("See ya later")
  end

  scenario 'trying to access a secure path' do
    visit "/app"
    expect(page.current_path).to eq("/")
    expect(page).to have_content("Please sign in")
  end
end
