module Features
  module SessionHelpers
    def sign_in
      generic_user = FactoryGirl.create(:user)
      SignInPage.new.sign_in(generic_user)
    end
  end
end