require 'spec_helper'

feature 'Show recording', js: true do
  let(:show_recording_page) { ShowRecordingPage.new }

  describe 'confirmed' do
    let!(:recording) { FactoryGirl.create(:recording, state: :confirmed) }
    let!(:piece) { FactoryGirl.create(:piece, recording: recording) }

    scenario do
      sign_in(recording.user)
      show_recording_page.visit_page(recording)
      expect(show_recording_page.state).to eq('confirmed')
    end
  end

  describe 'finished' do
    let!(:recording) { FactoryGirl.create(:recording, state: :finished) }
    let!(:piece) { FactoryGirl.create(:piece, recording: recording) }

    scenario do
      sign_in(recording.user)
      show_recording_page.visit_page(recording)
      show_recording_page.play_piece(piece)
      expect(show_recording_page).to be_playing(piece)
    end
  end
end
