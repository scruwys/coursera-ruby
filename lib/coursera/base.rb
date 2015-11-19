require 'httparty'

module Coursera
  class Base
    include HTTParty

    base_uri 'https://api.coursera.org/api'

    def initialize(json)
      @parsed = json.is_a?(Hash) ? json : JSON.parse(json)

      @parsed.each do |k, v|
        define_singleton_method(k) { v }
      end
    end
  end
end