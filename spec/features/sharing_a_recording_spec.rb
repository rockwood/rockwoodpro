require 'spec_helper'

feature "Sharing a recording", js: true do
  let(:user) { create(:user) }
  let(:recording) { create(:recording, :finished, user: user) }
  let!(:shared_piece) { create(:piece, recording: recording) }
  let!(:unshared_piece) { create(:piece, recording: recording) }

  scenario "Sharing a recording" do
    sign_in(user)
    show_recording_page.visit_page(recording)
    show_recording_page.share_piece(shared_piece)
    sign_out
    shared_recording_page.visit_page(recording)
    expect(shared_recording_page).to have_piece(shared_piece)
    expect(shared_recording_page).to have_no_piece(unshared_piece)
  end
end
