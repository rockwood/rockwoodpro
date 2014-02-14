require 'spec_helper'

feature "process recording" do
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:admin_recordings_index_page){ AdminRecordingsIndexPage.new }
  let(:admin_recording_row){ AdminRecordingRow.new(recording) }

  before { sign_in admin_user }

  describe 'confirming' do
    let!(:recording){ FactoryGirl.create(:recording) }

    scenario do
      admin_recordings_index_page.visit_page
      admin_recording_row.confirm
      recording.reload
      expect(recording.state).to eq("confirmed")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("confirmed")
    end
  end

  describe 'finishing' do
    let!(:recording){ FactoryGirl.create(:recording, state: :confirmed) }
    scenario do
      admin_recordings_index_page.visit_page
      admin_recording_row.finish
      recording.reload
      expect(recording.state).to eq("finished")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("finished")
    end
  end
end