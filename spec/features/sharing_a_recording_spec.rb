require 'spec_helper'

feature "Sharing a recording", js: true do
  let(:user) { create(:user) }
  let(:recording) { create(:recording, :finished, user: user) }

  scenario "Sharing a recording" do
    sign_in(user)
    show_recording_page.visit_page(recording)
    show_recording_page.share
    sign_out
    show_recording_page.visit_page(recording)
    expect(show_recording_page).to be_showing(recording)  
  end
end
