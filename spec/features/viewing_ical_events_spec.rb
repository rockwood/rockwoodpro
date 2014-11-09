require 'spec_helper'

feature 'Viewing ical events' do
  let!(:recording) { FactoryGirl.create(:recording, datetime: Date.new(2013, 01, 01), state: :confirmed)}
  scenario do
    ical_page.visit_page
    expect(ical_page).to have_event_location(recording.location)
    expect(ical_page).to have_event_start(recording.datetime)
    expect(ical_page).to have_event_status("CONFIRMED")
  end


  scenario "updating the event sequence" do
    recording.update(datetime: Date.new(2013, 01, 02))
    ical_page.visit_page
    expect(ical_page).to have_sequence(3)
  end
end
