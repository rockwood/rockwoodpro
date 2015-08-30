require 'spec_helper'

describe MailTemplate do
  let(:recording) { FactoryGirl.build(:recording) }

  describe ".recording_confirmation" do
    let(:mail_template) { MailTemplate.recording_confirmation(to: "bob@example.com", recording: recording) }

    it "has a to" do
      expect(mail_template.to).to eq("bob@example.com")
    end

    it "has a subject" do
      expect(mail_template.subject).to eq("Rockwood Productions - Your Recording")
    end

    it "has a body" do
      expect(mail_template.body).to include("Hi #{recording.user.first_name}")
    end
  end
end

