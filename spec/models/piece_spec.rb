require 'spec_helper'

describe Piece do
  let(:piece) { FactoryGirl.build(:piece) }

  it "has a valid factory" do
    expect(piece).to be_valid
  end

  describe "base_url" do
    it "has a base_url" do
      expect(piece.base_url).to match(ENV['CDN_ROOT'])
    end
  end

  describe "file_url" do
    describe "with a recording directory and filename" do
      before do
        piece.filename = "filename.mp4"
        piece.recording.directory = "recording_directory"
      end
      it "returns a file url" do
        expect(piece.file_url).to match("/recording_directory/filename.mp4")
      end
    end

    describe "without a recording.directory" do
      before do
        piece.filename = "filename.mp4"
        piece.recording.directory = nil
      end
      it "returns false" do
        expect(piece.file_url).to eq(nil)
      end
    end

    describe "without a filename" do
      before do
        piece.filename = nil
        piece.recording.directory = "recording_directory"
      end
      it "returns false" do
        expect(piece.file_url).to eq(nil)
      end
    end
  end

  describe ".from_filename" do
    let(:filename) { "test.mp4" }
    let(:piece) { Piece.from_filename(filename) }
    it "returns a new piece with the appropriate filetype" do
      expect(piece.filename).to eq(filename)
      expect(piece.filetype).to eq("video")
    end
  end
end

describe FileParser do
  describe ".parse_filetype" do
    let(:file_parser) { FileParser.new(filename) }
    context "video" do
      let(:filename) { "test.mp4" }
      it "parses the filetype" do
        expect(file_parser.filetype).to eq("video")
      end
    end
    context "audio" do
      let(:filename) { "test.mp3" }
      it "parses the filetype" do
        expect(file_parser.filetype).to eq("audio")
      end
    end
  end
end