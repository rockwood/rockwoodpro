require 'spec_helper'

feature "Requesting a password reset" do
  let(:user) { FactoryGirl.create(:user) }
  let(:create_password_reset_page) { CreatePasswordResetPage.new }

  scenario "with a valid email" do
    create_password_reset_page.create(user)
    user.reload
    expect(create_password_reset_page).to be_successful
    expect(MostRecentEmail).to be_sent_to(user.email)
    expect(MostRecentEmail).to have_in_body(user.password_reset_token)
  end

  scenario "with an invalid email" do
    user.email = "incorrect@email.com"
    create_password_reset_page.create(user)
    expect(create_password_reset_page).to be_unsuccessful
  end
end

feature "Verifying a password reset" do
  let(:user) { FactoryGirl.create(:user, password_reset_token: "abc", password_reset_expiration: 1.day.from_now) }
  let(:edit_password_reset_page) { EditPasswordResetPage.new }
  scenario 'with a valid token' do
    edit_password_reset_page.edit(user)
    expect(edit_password_reset_page).to be_successful
  end

  scenario 'with an expired token' do
    user.update_attributes(password_reset_expiration: 1.day.ago)
    edit_password_reset_page.visit_page(user.password_reset_token)
    expect(edit_password_reset_page).to be_unsuccessful
  end
end