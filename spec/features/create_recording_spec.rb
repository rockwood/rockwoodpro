require 'spec_helper'

feature 'Create Recording' do
  before { sign_in }
  let(:create_recording_page){ CreateRecordingPage.new }

  scenario 'with a valid recording' do
    valid_recording = FactoryGirl.build(:recording)
    create_recording_page.create(valid_recording)
    expect(create_recording_page).to be_successful
  end

  scenario 'with an invalid recording' do
    invalid_recording = FactoryGirl.build(:recording, location: nil)
    create_recording_page.create(invalid_recording)
    expect(create_recording_page).to_not be_successful
  end
end
