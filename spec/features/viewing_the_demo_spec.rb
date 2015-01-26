require 'spec_helper'

feature 'Viewing the demo', js: true do
  let!(:demo_recording) { create(:recording, demo: true, state: 'finished') }
  let!(:demo_piece) { create(:piece, recording: demo_recording, shared: true) }
  let!(:non_demo_piece) { create(:piece) }

  scenario do
    home_page.visit_demo
    expect(shared_recording_page).to have_piece(demo_piece)
    expect(shared_recording_page).to have_no_piece(non_demo_piece)
  end
end
