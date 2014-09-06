require 'spec_helper'

describe RecordingPolicy do
  describe "#scoped_pieces" do
    let!(:user) { create(:user) }
    let!(:shared_piece) { create(:piece, recording: recording, shared: true) }
    let!(:unshared_piece) { create(:piece, recording: recording, shared: false) }
    subject(:policy) { RecordingPolicy.new(user, recording) }

    context "owner" do
      let(:recording) { create(:recording, user: user) }
      specify do
        expect(policy.scoped_pieces).to eq([shared_piece, unshared_piece])
      end
    end

    context "non owner" do
      let(:recording) { create(:recording) }
      specify do
        expect(policy.scoped_pieces).to eq([shared_piece])
      end
    end
  end
end
