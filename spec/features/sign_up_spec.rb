require 'spec_helper'

feature 'Sign up' do
  let(:sign_up_page){ SignUpPage.new }

  scenario 'with a valid user' do
    valid_user = FactoryGirl.build(:user)
    sign_up_page.sign_up(valid_user)
    expect(sign_up_page).to be_successful
  end

  scenario 'with an invalid user' do
    invalid_user = FactoryGirl.build(:user, password: "")
    sign_up_page.sign_up(invalid_user)
    expect(sign_up_page).to_not be_successful
  end
end
