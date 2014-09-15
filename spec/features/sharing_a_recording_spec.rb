require 'spec_helper'

feature "Sharing a recording", js: true do
  let!(:user) { create(:user) }
  let!(:recording) { create(:recording, :finished, user: user) }
  
  context "as the author" do
    let!(:piece) { create(:piece, recording: recording, shared: true) }
    before { sign_in(user) }
    scenario "viewing the share link" do
      show_recording_page.visit_page(recording)
      expect(show_recording_page).to have_share_link_for(recording)
    end
    scenario "unsharing a shard piece" do
      show_recording_page.visit_page(recording)
      show_recording_page.unshare_piece(piece)
      eventually do
        expect(piece.reload).to_not be_shared
      end
    end
  end
  
  context "as the author's grandma" do
    let!(:shared_piece) { create(:piece, recording: recording, shared: true) }
    let!(:unshared_piece) { create(:piece, recording: recording, shared: false) }
    scenario "viewing the shared recording" do
      shared_recording_page.visit_page(recording)
      expect(shared_recording_page).to have_piece(shared_piece)
      expect(shared_recording_page).to have_no_piece(unshared_piece)
    end
  end
end
