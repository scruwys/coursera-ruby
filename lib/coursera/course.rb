module Coursera
  class Course < Coursera::Base
   
    # => Coursera::Course.find("Gtv4Xb1-EeS-ViIACwYKVQ")
    def self.find(id, attrs = {})
      attrs = self.prepare_attributes(attrs)
      route = "/courses.v1/#{id}"

      Coursera::Course.new self.get(route, {query: attrs})["elements"][0]
    end
  end
end