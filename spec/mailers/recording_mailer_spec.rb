require 'spec_helper'

describe RecordingMailer do
  let(:user) { FactoryGirl.create(:user) }

  describe "requested" do
    let(:recording) { FactoryGirl.create(:recording, user: user) }
    before { RecordingMailer.requested(recording).deliver }
    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
    end
  end

  describe "confirmed" do
    let(:recording) { FactoryGirl.create(:recording, user: user) }
    before { RecordingMailer.confirmed(recording, "test_comments").deliver }
    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
      expect(Email.last.text_part.body).to match(recording.datetime.strftime("%A, %B %e at %l:%M%P"))
      expect(Email.last.text_part.body).to match("test_comments")
    end
  end

  describe "finished" do
    let(:recording) {FactoryGirl.create(:recording, user: user)}
    before { RecordingMailer.finished(recording, "test_comments").deliver }
    it "has the correct stuff" do
      expect(Email.last.to).to include(user.email)
      expect(Email.last.subject).to match("Your Recording")
      expect(Email.last.text_part.body).to match("#/recordings/#{recording.id}")
      expect(Email.last.text_part.body).to match("test_comments")
    end
  end
end
