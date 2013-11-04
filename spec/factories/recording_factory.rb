FactoryGirl.define do
  factory :recording do
    datetime Date.today
    cds 1
    dvds 2
    location "here"
    level "Audio and Video"
    context "Live Performance"
    directory "testing"
    association :user
  end
end
