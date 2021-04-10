# frozen_string_literal: true

require "database_cleaner/active_record"

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |teste|
    DatabaseCleaner.cleaning do
      teste.run
    end
  end
end
