ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Capybara::DSL
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.after(:each) { DatabaseCleaner.clean }
end
