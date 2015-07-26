source 'https://rubygems.org'
ruby '2.1.3'

gem 'rails', '4.2.0'
gem 'haml'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'decent_exposure'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'simple_form'
gem 'active_model_serializers', '~> 0.8.3'
gem 'state_machine'
gem 'ember-rails'
gem 'aws-sdk'
gem 'compass-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'maildown'
gem 'pundit'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :development, :test do
  gem 'rspec-core', '~> 2.14.0'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'email_spec'
  gem 'dotenv-rails'
  gem 'pry'
end

group :test do
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'database_cleaner'
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'asset_sync'
end
