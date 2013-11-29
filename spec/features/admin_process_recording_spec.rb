require 'spec_helper'

feature "process recording" do
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:edit_admin_recording_page){ EditAdminRecordingPage.new }

  before { sign_in admin_user }

  describe 'confirming' do
    let(:recording){ FactoryGirl.create(:recording) }  
    
    scenario do
      edit_admin_recording_page.visit_page(recording)
      edit_admin_recording_page.confirm_recording

      recording.reload
      expect(recording.state).to eq("confirmed")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("confirmed")
    end
  end

  describe 'finishing' do
    let(:recording){ FactoryGirl.create(:recording, state: :confirmed) }
    scenario do
      edit_admin_recording_page.visit_page(recording)
      edit_admin_recording_page.finish_recording

      recording.reload
      expect(recording.state).to eq("finished")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("finished")
    end
  end
end