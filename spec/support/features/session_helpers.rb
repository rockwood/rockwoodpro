module SessionHelpers
  def sign_in(user = nil)
    SignInPage.new.sign_in(user || FactoryGirl.create(:user))
  end
end
