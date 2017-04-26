source 'https://rubygems.org'

ruby '2.4.0'
gem 'coffee-rails', '~> 4.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'paperclip', '~> 5.0.0'
gem 'pundit'
gem 'remotipart'
gem 'sprockets-rails'

gem 'devise'
gem 'haml-rails', '~> 0.9'

group :test do
  gem 'capybara'
  gem 'chromedriver-helper' # Use to work on TravisCI
  gem 'shoulda-matchers', '~> 3.1'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop
  # execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  # Access an IRB console on exception pages or by
  # using <%= console %> anywhere in the code.
  gem 'better_errors'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your
  # application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
