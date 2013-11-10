require 'spec_helper'

describe UserMailer do
  let(:user) { FactoryGirl.create(:user) }

  describe "requested_recording" do
    let(:recording) { FactoryGirl.create(:recording, user: user) }
    before { UserMailer.requested_recording(recording).deliver }

    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
    end
  end

  describe "confirmed_recording" do
    let(:recording) { FactoryGirl.create(:recording, user: user) }
    before { UserMailer.confirmed_recording(recording).deliver }

    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
      expect(Email.last.body).to match(recording.datetime.strftime("%A, %B %e at %l:%M%P"))
    end
  end

  describe "finished_recording" do
    let(:recording) {FactoryGirl.create(:recording, user: user)}
    before { UserMailer.finished_recording(recording).deliver }

    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
      expect(Email.last.body).to match(recording_url(recording))
    end
  end

  describe "password_reset" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      user.generate_password_reset
      UserMailer.password_reset(user).deliver
    end

    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.body).to match(edit_password_reset_url(user.password_reset_token))
    end
  end
end