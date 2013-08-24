require 'spec_helper'

feature 'Password reset' do
  let(:user) { FactoryGirl.create(:user) }
  let(:create_password_reset_page) { CreatePasswordResetPage.new }
  let(:password_reset_email) { PasswordResetEmail.new }

  scenario 'with a valid user' do
    create_password_reset_page.create(user)
    expect(create_password_reset_page).to be_successful
    expect(password_reset_email).to be_sent_to(user.email)
  end
end