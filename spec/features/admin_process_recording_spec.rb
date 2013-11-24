require 'spec_helper'

feature 'Confirm recording' do
  let(:recording){ FactoryGirl.create(:recording) }
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:admin_recording_edit_page){ AdminRecordingPage.new }
  before { sign_in admin_user }

  scenario do
    admin_recording_page.visit_page(recording)
    admin_recording_page.confirm_recording
    expect(admin_recording_page).to be_successful
    expect(Email.last.to).to include(recording.user)
    expect(Email.last.body).to match(user.password_reset_token)
  end
end