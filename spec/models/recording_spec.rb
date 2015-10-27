require 'spec_helper'

describe Recording do
  it "has a valid factory" do
    expect(FactoryGirl.build(:recording)).to be_valid
  end

  describe "#create_directory" do
    let(:recording) { FactoryGirl.build(:recording) }
    let(:file_store_mock) { double("file_store") }
    before { allow(recording).to receive(:file_store).and_return(file_store_mock) }

    describe "with no directory specified" do
      before { recording.directory = nil }
      it "stores the object and sets the default directory" do
        expect(file_store_mock).to receive(:write_file)
        recording.create_directory
        expect(recording.directory).to match(/#{recording.user.first_name}_#{recording.user.last_name}/)
      end
    end

    describe "with a directory specified" do
      before { recording.directory = "test" }
      it "stores the object and sets the specified directory" do
        expect(file_store_mock).to receive(:write_file).with("test/temp.txt", recording.location)
        recording.create_directory
        expect(recording.directory).to eq("test")
      end
    end
  end

  describe "#discover_pieces" do
    let(:recording) { FactoryGirl.create(:recording, directory: "test_dir") }
    let(:file_list) { ["file1.mp4", "file2.mp4"] }
    let(:file_store_mock) { double("file_store") }

    before do
      allow(file_store_mock).to receive(:list_directory).and_return(file_list)
      allow(recording).to receive(:file_store).and_return(file_store_mock)
    end

    it "creates pieces for each file" do
      recording.discover_pieces
      expect(recording.pieces.count).to eq(2)
    end

    it "doesn't create duplicates" do
      recording.discover_pieces
      recording.discover_pieces
      recording.reload
      expect(recording.pieces.count).to eq(2)
      expect(recording.pieces.first.filename).to eq("file1.mp4")
      expect(recording.pieces.first.filetype).to eq("video")
    end

    it "ignores the placeholder file" do
      file_list << Recording::PLACEHOLDER_FILE
      recording.discover_pieces
      expect(recording.pieces.count).to eq(2)
    end
  end

  describe "state" do
    let(:user) { FactoryGirl.build(:user) }
    let(:recording) { FactoryGirl.build(:recording, user: user) }

    describe "request!" do
      it "moves to the unconfirmed state" do
        recording.request!
        expect(recording.state).to eq("requested")
      end
    end

    describe "confirm!" do
      it "moves to the confirmed state" do
        recording.confirm!
        expect(recording.state).to eq("confirmed")
      end
    end

    describe "finish!" do
      it "moves to the confirmed state" do
        recording.stub(:discover_pieces)
        expect(recording).to receive(:discover_pieces)
        recording.finish!
        expect(recording.state).to eq("finished")
      end
    end
  end

  describe ".live_now" do
    let!(:recording) { create(:recording, embed_code: embed_code, datetime: datetime) }
    context "no embed_code" do
      let(:embed_code) { nil }
      let(:datetime) { Time.now }
      it "is nil" do
        expect(Recording.live_now).to be_nil
      end
    end

    context "with datetime in the future datetime and embed_code set" do
      let(:embed_code) { "123" }
      let(:datetime) { 1.day.from_now }
      it "is nil" do
        expect(Recording.live_now).to be_nil
      end
    end

    context "with a datetime of now and embed_code set" do
      let(:embed_code) { "123" }
      let(:datetime) { Time.now }
      it "returns the recording" do
        expect(Recording.live_now).to eq(recording)
      end
    end
  end
end
