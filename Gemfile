source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'jquery-rails'
gem 'devise'
gem 'cancan'
gem 'draper'
gem 'resque'
# gem 'wkhtmltopdf'
gem 'haml-rails'
gem 'symbolize'
gem 'responders'
gem 'whenever'
gem 'capybara'
gem 'pdfkit'
gem 'yaml_db'

gem 'sqlite3', group: [:test, :development]
gem 'pg', '0.15.1', group: [:development, :production]
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :production do
  gem "wkhtmltopdf-heroku", "~> 1.0.0"
end

