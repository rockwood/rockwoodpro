require 'spec_helper'

feature 'Switch to user' do
  let(:user){ FactoryGirl.create(:user) }
  let(:admin_user){ FactoryGirl.create(:user, admin: true) }
  let(:admin_user_page){ AdminUserPage.new }
  before { sign_in admin_user }

  scenario do
    admin_user_page.visit_page(user)
    admin_user_page.switch_to_user
    expect(admin_user_page).to be_signed_in_as_user(user)
  end
end