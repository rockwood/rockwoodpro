FactoryGirl.define do
  factory :recording do
    datetime Date.new(2013, 01, 01)
    cds 1
    dvds 2
    location "here"
    level "Audio and Video"
    context "Concert Recording"
  end
end
