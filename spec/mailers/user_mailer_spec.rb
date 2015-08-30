require 'spec_helper'

describe UserMailer do
  let(:user) { FactoryGirl.create(:user) }

  describe "password_reset" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      user.generate_password_reset
      UserMailer.password_reset(user).deliver_now
    end

    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.body).to match(edit_password_reset_url(user.password_reset_token))
    end
  end

  describe "recording_requested" do
    let(:recording) { FactoryGirl.create(:recording, user: user) }
    before { UserMailer.recording_requested(recording).deliver_now }
    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
    end
  end
end
