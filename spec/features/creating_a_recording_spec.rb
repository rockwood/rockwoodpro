require 'spec_helper'

feature 'Creating a recording', js: true do
  let(:user){ FactoryGirl.create(:user) }
  let!(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:new_recording_page){ NewRecordingPage.new }
  before { sign_in user }

  describe do
    context "with a valid recording" do
      let(:valid_recording) { FactoryGirl.build(:recording) }
      scenario do
        new_recording_page.create(valid_recording)
        expect(new_recording_page).to be_successful
        expect(Email.recipients).to include(admin_user.email)
        expect(Email.recipients).to include(user.email)
      end
    end
    
    context 'with an invalid recording' do
      let(:invalid_recording) { FactoryGirl.build(:recording, location: nil) } 
      scenario do
        new_recording_page.create(invalid_recording)
        expect(new_recording_page).to_not be_successful
        expect(Email.recipients).to_not include(user.email)
        expect(Email.recipients).to_not include(admin_user.email)
      end
    end
  end
  
  describe "viewing price" do

  end
end
