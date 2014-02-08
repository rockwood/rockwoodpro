require 'spec_helper'

feature 'Viewing ical events' do
  let(:calendar_page){ IcalPage.new }
  let!(:recording) { FactoryGirl.create(:recording, datetime: Date.new(2013, 01, 01))}
  scenario do
    calendar_page.visit_page
    expect(calendar_page).to have_event_location(recording.location)
    expect(calendar_page).to have_event_start(recording.datetime)
  end
end