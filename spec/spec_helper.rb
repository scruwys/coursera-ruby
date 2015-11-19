$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coursera'
require 'webmock/rspec'

WebMock.disable_net_connect! allow_localhost: true

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }