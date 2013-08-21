require 'spec_helper'

describe Recording do
  let(:recording) { FactoryGirl.build(:recording) }

  it "has a valid factory" do
    recording.should be_valid
  end

  describe "#create_directory" do
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
end
