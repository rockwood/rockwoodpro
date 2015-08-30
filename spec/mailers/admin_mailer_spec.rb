require 'spec_helper'

describe AdminMailer do
  let!(:admin_user) {FactoryGirl.create(:user, admin: true)}

  describe "requested_recording" do
    let(:recording) {FactoryGirl.create(:recording, location: "Right Here")}
    before { AdminMailer.requested_recording(User.admins, recording).deliver_now }

    it "has the correct stuff" do
      expect(Email.last.html_part.body).to match(recording.user.first_name)
      expect(Email.last.html_part.body).to match(recording.location)
      expect(Email.last.html_part.body).to match(admin_recording_url(recording))
    end
  end
end
