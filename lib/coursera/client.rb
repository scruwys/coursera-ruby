require "coursera/base"
require "coursera/course"

module Coursera
  class Client < Coursera::Base

    # => client = Coursera::Client.new
    def initialize(options = {})
      @options = options
    end

    def find_course(id, attrs = {})
      Coursera::Course.find id, attrs
    end

    # => client.search_courses("data analytics", { fields: [:name, :photo] })
    def search_courses(query, attrs = {})
      attrs = self.class.prepare_attributes(attrs)
      Coursera::Course.batch_request("/courses.v1?q=search", { query: query}.merge(attrs))
    end
  end
end