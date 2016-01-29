require File.dirname(__FILE__) + '/../app/controllers/application_controller'
require File.dirname(__FILE__) + '/../app/controllers/rent_controller'

require 'rspec'
require 'rack/test'

set :environment, :test

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
