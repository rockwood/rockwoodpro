require 'spec_helper'

feature "process recording" do
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }

  before { sign_in admin_user }

  describe 'confirming' do
    let!(:recording){ FactoryGirl.create(:recording) }

    scenario do
      admin_recordings_index_page.visit_page
      admin_recordings_index_page.confirm(recording)
      recording.reload
      expect(recording.state).to eq("confirmed")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("confirmed")
      expect(recording.reload.directory).to_not be_nil
    end
  end

  describe 'finishing' do
    let!(:recording){ FactoryGirl.create(:recording, state: :confirmed) }

    scenario do
      admin_recordings_index_page.visit_page
      admin_recordings_index_page.finish(recording)
      recording.reload
      expect(recording.state).to eq("finished")
      expect(Email.last.to).to include(recording.user.email)
      expect(Email.last.body).to match("finished")
    end
  end
end
