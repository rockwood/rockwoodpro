require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  describe "#generate_password_reset" do
    before { user.generate_password_reset }
    it "sets the reset token" do
      expect(user.password_reset_token).to_not be_nil
    end
    it "sets the reset expiration" do
      expect(user.password_reset_expiration).to_not be_nil
    end
  end

  describe "#verify_password_reset" do
    before do
      user.update_attributes(
        password_reset_token: "abc",
        password_reset_expiration: 1.day.from_now)
    end
    context "with correct token" do
      it "is true" do
        expect(user.verify_password_reset("abc")).to eq(true)
      end
    end
    context "with incorrect token" do
      it "is false" do
        expect(user.verify_password_reset("1234")).to eq(false)
      end
    end
    context "with an expired token" do
      it "is false" do
        user.update_attributes(password_reset_expiration: 1.day.ago)
        expect(user.verify_password_reset(user.password_reset_token)).to eq(false)
      end
    end
  end

  describe "#clear_password_reset" do
    before do
      user.update_attributes(
        password_reset_token: "abc",
        password_reset_expiration: 1.day.from_now)
    end
    it "clears password reset fields" do
      user.clear_password_reset
      expect(user.password_reset_token).to be_nil
      expect(user.password_reset_expiration).to be_nil
    end
  end

  describe ".admins" do
    let(:admin_user) { FactoryGirl.create(:user, admin: true) }
    it "returns only admins" do
      expect(User.admins).to eq([admin_user])
    end
  end
end