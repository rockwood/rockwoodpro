require 'spec_helper'

feature 'Create Recording' do
  let(:user){ FactoryGirl.create(:user) }
  let(:create_recording_page){ CreateRecordingPage.new }
  let(:valid_recording) { FactoryGirl.build(:recording) }
  let(:invalid_recording) { FactoryGirl.build(:recording, location: nil) }

  before { sign_in user }

  scenario 'with a valid recording' do
    create_recording_page.create(valid_recording)
    expect(create_recording_page).to be_successful
    expect(Email.recipients).to include(user.email)
  end

  scenario 'with an invalid recording' do
    create_recording_page.create(invalid_recording)
    expect(create_recording_page).to_not be_successful
    expect(Email.recipients).to_not include(user.email)
  end
end
