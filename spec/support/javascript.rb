require 'capybara/poltergeist'
Capybara.javascript_driver = ENV.fetch("JS_DRIVER", "poltergeist").to_sym