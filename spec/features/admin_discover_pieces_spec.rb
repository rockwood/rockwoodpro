require 'spec_helper'

feature 'Discover pieces' do
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:admin_recording_page){ AdminRecordingPage.new }
  let(:recording) { FactoryGirl.create(:recording, directory: "file_discovery_test") }
  before { sign_in admin_user }

  scenario do
    admin_recording_page.visit_page(recording)
    admin_recording_page.discover_pieces
    expect(admin_recording_page.pieces).to eq(["piece1.mp4", "piece2.mp4"])
  end
end