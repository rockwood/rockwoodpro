module SessionHelpers
  def sign_in(user = nil)
    SignInPage.new.sign_in(user || FactoryGirl.create(:user))
  end

  def sign_out
    visit sign_out_path
  end
end
