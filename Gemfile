source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'


gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# ===============================================================
#                      we added these gems
# ===============================================================

gem 'devise'
gem 'rails_admin'
gem 'faker'
gem 'rubocop', require: false
gem 'sprockets-rails', :require => 'sprockets/railtie'

gem 'hirb'
gem 'cancancan'
gem 'pg'
gem 'multiverse'
gem 'rails_admin_import', '~> 2.2'

gem 'chartkick'
gem 'groupdate'


gem 'figaro'
gem 'rails_admin_google_map'
gem 'sendgrid-ruby'
gem 'ibm_watson'
gem "zendesk_api"
gem 'rspotify'
gem 'rack-cors'
gem 'active_model_serializers'
gem 'twilio-ruby'
gem 'slack-notifier'
gem 'dropbox_api'
gem 'recaptcha', '~> 5.7'
gem 'rspec-rails', '~> 3.0'
gem 'webmock'
gem 'json'
gem 'open-weather-ruby-client'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-puma'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]