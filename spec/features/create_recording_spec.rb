require 'spec_helper'

feature 'Create Recording' do
  before { sign_in }
  let(:new_recording_page){ NewRecordingPage.new }

  scenario 'with a valid recording' do
    valid_recording = FactoryGirl.build(:recording)
    new_recording_page.visit_page
    new_recording_page.fill_form(valid_recording)
    new_recording_page.submit_form
    new_recording_page.should be_successful
  end

  scenario 'with an invalid recording' do
    invalid_recording = FactoryGirl.build(:recording, context: nil)
    new_recording_page.visit_page
    new_recording_page.fill_form(invalid_recording)
    new_recording_page.submit_form
    new_recording_page.should_not be_successful
  end
end
