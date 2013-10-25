require 'spec_helper'

feature 'Resetting a legacy account' do
  let(:sign_in_page){ SignInPage.new }
  let(:legacy_reset_page){ EditLegacyPasswordResetPage.new }
  let(:legacy_user){ FactoryGirl.create(:user, legacy: true) }

  scenario 'signing in with a legacy user' do
    sign_in_page.visit_page
    sign_in_page.sign_in(legacy_user)
    expect(legacy_reset_page).to be_showing

    legacy_reset_page.submit_form("new_password")
    expect(legacy_reset_page).to be_successful
  end
end