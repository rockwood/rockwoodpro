require 'spec_helper'

feature 'Sign out' do
  scenario 'when already signed in' do
    sign_in
    visit "/sign_out"
    visit "/recordings"
    page.current_path.should == "/" && page.has_content?("See ya later")
  end
end
