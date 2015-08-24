require 'spec_helper'

describe MailTemplate do
  let(:recording) { FactoryGirl.build(:recording) }

  describe ".confirmation_for" do
    let(:mail_template) { MailTemplate.confirmation(recording) }

    it "has a subject" do
      expect(mail_template.subject).to eq("Rockwood Productions - Your Recording")
    end

    it "has a body" do
      expect(mail_template.body).to include("Hi #{recording.user.first_name}")
    end
  end
end

