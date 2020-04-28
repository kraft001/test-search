source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# HAML for email templates
gem 'haml-rails'

# Rails gem for fast jsonapi-compliant APIs
gem 'jsonapi-serializers'

# Use Sidekiq for background jobs
gem 'sidekiq'

# Build ActiveRecord named scopes that take advantage of PostgreSQL's full text search
gem 'pg_search'

# Use factories over fixtures for sample data
gem 'factory_bot_rails'

# Fake data generator
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  # Annotate Rails classes with schema and routes info
  gem 'annotate'

  # A command line tool to easily handle events on file system modifications
  gem 'guard'

  # Automatically run your specs (much like autotest)
  gem 'guard-rspec', require: false

  # Automatically check Ruby code style
  gem 'guard-rubocop', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  # Strategies for cleaning databases in Ruby.
  gem 'database_cleaner'

  # The RSpec testing framework with Rails integrations
  gem 'rspec-its'

  # RSpec testing for Rails
  gem 'rspec-rails'

  # Show failing specs instantly
  gem 'rspec-instafail'

  # Provides standardised output on CI servers
  gem 'rspec_junit_formatter'

  # Rspec cops for rubocop
  gem 'rubocop-rspec'

  # A RuboCop extension focused on enforcing Rails best practices
  # and coding conventions.
  gem 'rubocop-rails'

  # Simple Cov for code coverage
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  # 12 factor for deploy to heroku
  gem 'rails_12factor'
end
