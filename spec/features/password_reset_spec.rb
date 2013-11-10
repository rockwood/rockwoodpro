require 'spec_helper'

feature "Requesting a password reset" do
  let(:user) { FactoryGirl.create(:user) }
  let(:create_password_reset_page) { CreatePasswordResetPage.new }

  scenario "with a valid email" do
    create_password_reset_page.create(user)
    user.reload #  reload to get the updated password
    expect(create_password_reset_page).to be_successful
    expect(Email.last.to).to include(user.email)
    expect(Email.last.body).to match(user.password_reset_token)
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
    edit_password_reset_page.edit(user, "new_password")
    user.reload # reload to authenticate against the updated password
    expect(edit_password_reset_page).to be_successful
    expect(user.authenticate("new_password")).to eq(user)
  end

  scenario 'with an invalid token' do
    edit_password_reset_page.visit_page("not_a_valid_token")
    expect(edit_password_reset_page).to be_unsuccessful
  end

  scenario 'with an expired token' do
    user.update_attributes(password_reset_expiration: 1.day.ago)
    edit_password_reset_page.visit_page("abc")
    expect(edit_password_reset_page).to be_unsuccessful
  end
end