FactoryGirl.define do
  factory :recording do
    datetime Date.today
    cds 1
    dvds 2
    location "here"
    level "Single Camera"
    context "Live Performance"
    directory "testing"
    user
    live_stream true
    duration 1
    trait :finished do
      state "finished"
    end
  end
end
