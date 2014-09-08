require 'spec_helper'

feature "Sharing a recording", js: true do
  let(:user) { create(:user) }
  let(:recording) { create(:recording, :finished, user: user) }
  
  describe "Sharing a recording" do
    let!(:piece) { create(:piece, recording: recording) }
    scenario do
      sign_in(user)
      show_recording_page.visit_page(recording)
      show_recording_page.share_piece(piece)
      eventually do
        expect(show_recording_page).to have_share_link_for(recording)
        expect(piece.reload).to be_shared
      end
    end
  end
  
  describe "Viewing a shared recording" do
    let!(:shared_piece) { create(:piece, recording: recording, shared: true) }
    let!(:unshared_piece) { create(:piece, recording: recording) }
    scenario do
      shared_recording_page.visit_page(recording)
      expect(shared_recording_page).to have_piece(shared_piece)
      expect(shared_recording_page).to have_no_piece(unshared_piece)
    end
  end
end
