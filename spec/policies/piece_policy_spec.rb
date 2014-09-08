require 'spec_helper'

describe PiecePolicy do
  describe "#update?" do
    let(:user) { double("User") }
    let(:piece) { double("Piece", recording: recording) }
    context "owner" do
      let(:recording) { double("Recording", user: user) }
      specify do
        expect(PiecePolicy.new(user, piece).update?).to be(true)
      end
    end

    context "non owner" do
      let(:recording) { double("Recording", user: nil) }
      specify do
        expect(PiecePolicy.new(user, piece).update?).to be(false)
      end
    end
  end
end
