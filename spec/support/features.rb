RSpec.configure do |config|
  config.include SessionHelpers, type: :feature
  config.include PageFinder, type: :feature
end
