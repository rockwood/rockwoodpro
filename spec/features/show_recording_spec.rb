require 'spec_helper'

feature 'Show recording', js: true do
  let(:show_recording_page) { ShowRecordingPage.new }
  let(:piece) { FactoryGirl.create(:piece) }

  scenario 'playing a piece' do
    sign_in(piece.recording.user)

    show_recording_page.visit_page(piece.recording)
    show_recording_page.play_piece(piece)
    expect(show_recording_page).to be_playing(piece)
  end
end
