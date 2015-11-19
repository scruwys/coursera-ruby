$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coursera'
require 'webmock/rspec'

WebMock.disable_net_connect! allow_localhost: true

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

def data_from_json(json_name)
  JSON.parse File.open(File.dirname(__FILE__) + "/support/fixtures/#{json_name}", 'rb').read
end

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /api\.coursera\.org/).to_rack(FakeCoursera)
  end
end