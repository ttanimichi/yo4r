$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yo4r'

RSpec.configure do |config|
  config.expect_with :rspec do |config|
    config.syntax = [:should]
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end
