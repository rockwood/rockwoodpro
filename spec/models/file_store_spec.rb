require 'spec_helper'

describe FileStore do
  describe "write_file" do
    let(:file_store) { FileStore.new }
    let(:objects_mock) { double("objects") }
    let(:writer_mock) { double("write") }
    before { allow(file_store).to receive(:objects).and_return(objects_mock) }
    it "writes the file" do
      expect(objects_mock).to receive(:[]).with("test_directory").and_return(writer_mock)
      expect(writer_mock).to receive(:write).with("test_content")
      file_store.write_file("test_directory", "test_content")
    end
  end

  describe "#list_directory" do
    let(:file_list) { ["test_dir/file1.mp4", "test_dir/file2.mp4"] }
    let(:file_store) { FileStore.new }
    let(:objects_mock) { double("objects") }
    before { allow(file_store).to receive(:objects).and_return(objects_mock) }
    it "writes the file" do
      expect(objects_mock).to receive(:with_prefix).and_return(file_list)
      expect(file_store.list_directory("test_dir")).to eq(["file1.mp4", "file2.mp4"])
    end
  end
end