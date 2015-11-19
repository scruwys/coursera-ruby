module Coursera
  class Course < Coursera::Base

    # => Coursera::Course.all(limit: 10)
    def self.all(attrs = {})
      Coursera::Course.batch_request("/courses.v1", self.prepare_attributes(attrs))
    end
       
    # => Coursera::Course.find("Gtv4Xb1-EeS-ViIACwYKVQ")
    def self.find(id, attrs = {})
      attrs = self.prepare_attributes(attrs)
      route = "/courses.v1/#{id}"

      Coursera::Course.new self.get(route, {query: attrs})["elements"][0]
    end
  end
end