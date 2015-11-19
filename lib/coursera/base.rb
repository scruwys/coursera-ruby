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

    def self.prepare_attributes(attrs)
      attrs.each do |key, value|
        attrs[key] = attrs[key].map(&:to_s).join(",") if attrs[key].kind_of?(Array)
      end
      attrs
    end

    def self.batch_request(route, attrs = {})
      request = self.get_elements(route, {query: attrs})
      results = []
      (request ||= []).each { |obj| results << new(obj) }
      results
    end

    def self.get_elements(route, attrs = {})
      self.get(route, attrs)["elements"]
    rescue
      nil
    end
  end
end