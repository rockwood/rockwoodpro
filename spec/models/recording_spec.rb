require 'spec_helper'

describe Recording do
  it "has a valid factory" do
    expect(FactoryGirl.build(:recording)).to be_valid
  end

  describe "#create_directory" do
    let(:recording) { FactoryGirl.build(:recording) }
    let(:s3) { double("S3Object") }
    before { allow(s3).to receive(:store) }

    describe "with no directory specified" do
      before { recording.directory = nil }
      it "stores the object" do
        expect(s3).to receive(:store)
        recording.create_directory(s3)
      end
      it "sets the directory" do
        recording.create_directory(s3)
        expect(recording.directory).to match(/#{recording.user.first_name}_#{recording.user.last_name}/)
      end
    end

    describe "with a directory specified" do
      before { recording.directory = "test" }
      it "stores the object" do
        expect(s3).to receive(:store).with("test/temp.txt", recording.location)
        recording.create_directory(s3)
      end
      it "sets the directory" do
        recording.create_directory(s3)
        expect(recording.directory).to eq("test")
      end
    end
  end

  describe "#list_directory" do
    let(:recording) { FactoryGirl.build(:recording, directory: "test_directory") }
    let(:file_list) { ["file1.mp4", "file1.mp4"] }
    let(:file_store_mock) { double("file_store") }
    before do
      allow(file_store_mock).to receive(:list_directory).and_return(file_list)
      allow(recording).to receive(:file_store).and_return(file_store_mock)
    end
    it "returns a list of files" do
      expect(recording.list_directory).to eq(file_list)
    end
  end

  describe "state" do
    let(:user) { FactoryGirl.build(:user) }
    let(:recording) { FactoryGirl.build(:recording, user: user) }
    let(:email) { double("email") }

    before do
      allow(UserMailer).to receive(:requested_recording).and_return(email)
      allow(UserMailer).to receive(:confirmed_recording).and_return(email)
      allow(UserMailer).to receive(:finished_recording).and_return(email)
      allow(email).to receive(:deliver)
    end

    describe "request!" do
      before { recording.request! }

      it "sends an unconfirmed email" do
        expect(UserMailer).to have_received(:requested_recording).with(recording)
        expect(email).to have_received(:deliver)
      end

      it "moves to the unconfirmed state" do
        expect(recording.state).to eq("requested")
      end
    end

    describe "confirm!" do
      before { recording.confirm! }

      it "sends a confirmation email" do
        expect(UserMailer).to have_received(:confirmed_recording).with(recording)
        expect(email).to have_received(:deliver)
      end

      it "moves to the confirmed state" do
        expect(recording.state).to eq("confirmed")
      end
    end

    describe "finish!" do
      before { recording.finish! }

      it "sends a finished email" do
        expect(UserMailer).to have_received(:finished_recording).with(recording)
        expect(email).to have_received(:deliver)
      end

      it "moves to the confirmed state" do
        expect(recording.state).to eq("finished")
      end
    end
  end
end
