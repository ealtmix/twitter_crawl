source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'simplecov', :require => false, :group => :test

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  #gem 'simplecov'
  gem 'ZenTest'
end

group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'therubyracer'
  gem 'devise'
  gem 'omniauth-twitter'
  gem 'twitter'
  gem 'em-twitter'
  gem 'tweetstream'
  gem 'daemons'
  gem 'yajl-ruby'
  gem 'jquery-rails'
  gem 'simple_oauth'
  gem 'multi_json'
end


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'minitest'
  gem 'turn', :require => false
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem "selenium-webdriver", "~> 2.32.1"
end

group :production do
  gem 'pg'
end
