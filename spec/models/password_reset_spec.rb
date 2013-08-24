require 'spec_helper'

describe PasswordReset do
  describe "#create_with_token" do
    let(:user) { FactoryGirl.create(:user) }
    let(:password_reset) { user.password_resets.create_with_token() }
    it "sets the token" do
      expect(password_reset.token).to_not eq(nil)
      expect(password_reset).to be_persisted()
    end
  end
end