source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'puma'
gem 'haml', '~> 4.0'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'decent_exposure'
gem 'activeadmin', github: 'gregbell/active_admin', branch: 'rails4'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'simple_form'
gem 'active_model_serializers'
gem 'state_machine'
gem 'ember-rails'
gem 'aws-s3'
gem 'ember-source', '~> 1.0.0.rc7'
gem 'polar-express'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'pry'
end

group :test do
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers' , branch: 'dp-rails-four'
  gem 'launchy'
  gem 'database_cleaner'
end

group :staging, :production do
  gem 'rails_12factor'
end