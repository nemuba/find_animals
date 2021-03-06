# frozen_string_literal: true

# Config Shoulda Matchers specs
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
