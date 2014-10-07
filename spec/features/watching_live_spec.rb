require 'spec_helper'

feature 'Watching live recordings', js: true do
  context "with an active recording" do
    let!(:recording) { create(:recording, datetime: Time.now, embed_code: "1234") }
    scenario do
      live_recording_page.visit_page
      expect(live_recording_page).to be_playing(recording)
    end
  end

  context "without an active recording" do
    let!(:recording) { create(:recording, datetime: 10.hours.from_now, embed_code: "1234") }
    scenario do
      live_recording_page.visit_page
      expect(live_recording_page).to be_inactive
    end
  end
end
