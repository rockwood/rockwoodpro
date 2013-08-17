FactoryGirl.define do
  sequence :email do |n|
    "test-#{n}@test.com"
  end

  factory :user do
    first_name "Lester"
    last_name "McTester"
    email
    password "password"
    password_confirmation "password"
  end
end
