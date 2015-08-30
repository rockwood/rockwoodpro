require 'spec_helper'

describe MailTemplate do
  let(:recording) { FactoryGirl.build(:recording) }

  describe ".recording_confirmation" do
    subject { MailTemplate.recording_confirmation(to: "bob@example.com", recording: recording) }

    it "has a to" do
      expect(subject.to).to eq("bob@example.com")
    end

    it "has a subject" do
      expect(subject.subject).to eq("Rockwood Productions - Your Recording")
    end

    it "has a body" do
      expect(subject.body).to include("Hi #{recording.user.first_name}")
    end
  end

  describe "body_html" do
    subject { MailTemplate.new(to: "bob@example.com", subject: "Subject", body: "some **markdown**") }

    it  "parses markdown" do
      expect(subject.body_html).to eq("<p>some <strong>markdown</strong></p>\n")
    end
  end
end

