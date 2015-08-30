require 'spec_helper'

feature "process recording" do
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }

  before { sign_in admin_user }

  describe 'confirming' do
    let!(:recording){ FactoryGirl.create(:recording, state: :requested) }

    context "with delivering an email" do
      it "sends the email" do
        admin_recordings_index_page.visit_page.confirm(recording)
        admin_email_page.submit(body: "test_comments")
        expect(recording.reload.state).to eq("confirmed")
        expect(recording.reload.directory).to_not be_nil
        expect(Email.last.to).to include(recording.user.email)
        expect(Email.last.text_part.body).to match("test_comments")
      end
    end

    context "without delivering an email" do
      it "does not send the email" do
        admin_recordings_index_page.visit_page.confirm(recording)
        admin_email_page.submit(deliver_email: false)
        expect(recording.reload.state).to eq("confirmed")
        expect(Email.last).to eq(nil)
      end
    end
  end

  describe 'finishing' do
    let!(:recording){ FactoryGirl.create(:recording, state: :confirmed) }

    context "with delivering an email" do
      it "sends the email" do
        admin_recordings_index_page.visit_page.finish(recording)
        admin_email_page.submit
        expect(recording.reload.state).to eq("finished")
        expect(Email.last.to).to include(recording.user.email)
        expect(Email.last.text_part.body).to include("finished")
      end
    end
  end
end
