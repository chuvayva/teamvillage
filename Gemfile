source 'https://rubygems.org'

ruby '2.3.3'
gem 'rails', '5.0.0.1'

gem 'jquery-rails'
gem 'devise'
gem 'cancan'
# gem 'draper'
# gem 'resque'

gem 'haml-rails'
gem 'symbolize'
gem 'responders'
gem 'capybara'
gem 'pdfkit'
gem 'test-unit'

gem 'unicorn'

group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :development do
  gem 'yaml_db'
  gem 'whenever'
end

group :production do
  gem "wkhtmltopdf-heroku", "~> 1.0.0"
end

gem 'pg', group: [:development, :production]

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end


