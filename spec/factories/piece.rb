FactoryGirl.define do
  factory :piece do
    sequence(:title) {|n| "title-#{n}" }
    sequence(:filename) {|n| "filename-#{n}.mp4" }
    sequence(:track_number)
    performer "John Do"
    composer "Bach"
    year 1999
    filetype "video"
    association :recording
  end
end