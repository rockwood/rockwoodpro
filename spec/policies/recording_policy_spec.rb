require 'spec_helper'

describe RecordingPolicy do
  subject(:policy) { RecordingPolicy.new(user, recording) }

  describe "#scoped_pieces" do
    let!(:user) { create(:user) }
    let!(:shared_piece) { create(:piece, recording: recording, shared: true) }
    let!(:unshared_piece) { create(:piece, recording: recording, shared: false) }

    context "owner" do
      let(:recording) { create(:recording, user: user) }
      specify do
        expect(policy.scoped_pieces).to include(shared_piece, unshared_piece)
      end
    end

    context "non owner" do
      let(:recording) { create(:recording) }
      specify do
        expect(policy.scoped_pieces).to eq([shared_piece])
      end
    end
  end

  describe "#update?" do
    let(:user) { build(:user) }

    context "owner" do
      let(:recording) { build(:recording, user: user) }
      specify { expect(policy.update?).to eq(true) }
    end

    context "non owner" do
      let(:recording) { build(:recording) }
      specify { expect(policy.update?).to eq(false) }
    end
  end

  describe "#show?" do
    let(:user) { build(:user) }

    context "when the user owns the recording" do
      let(:recording) { build(:recording, user: user) }

      it "returns true" do
        expect(policy.show?).to eq(true)
      end
    end

    context "when the recording has no shared peices" do
      let(:recording) { build(:recording) }

      it "returns false" do
        expect(policy.show?).to eq(false)
      end
    end

    context "when the recording has shared pieces" do
      let(:shared_piece) { create(:piece, shared: true) }
      let(:recording) { build(:recording, pieces: [shared_piece]) }

      it "returns true" do
        expect(policy.show?).to eq(true)
      end
    end
  end
end
