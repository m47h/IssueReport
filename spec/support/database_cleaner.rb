RSpec.configure do |config|
  # The order of these blocks is very significant. Right now our
  # js: true block overrides the plain one when a spec is js: true.
  # If it were reversed, Database Cleaner would always be using transactions
  # and since our js: true tests can't see those records there would be problems.
  # Next we have to actually clean up the database:
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  # This block must be here, do not combine with the other `before(:each)` block.
  # This makes it so Capybara can see the database.
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
