FactoryGirl.define do
  factory :piece do
    performer    "John Do"
    title        "An Awesome Piece"
    composer     "Bach"
    track_number 1
    year         1999
    filetype     "video"
    filename     "awesome.mp4"
    recording
  end
end