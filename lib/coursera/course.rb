module Coursera
  class Course < Coursera::Base
   
    # => Coursera::Course.all(limit: 10)
    def self.all(attrs = {})
      Coursera::Course.batch_request("/courses.v1", self.prepare_attributes(attrs))
    end

    # => Coursera::Course.find("Gtv4Xb1-EeS-ViIACwYKVQ")
    def self.find(id, attrs = {})
      attrs = self.prepare_attributes(attrs)
      elems = self.get_elements("/courses.v1/#{id}", {query: attrs})

      Coursera::Course.new elems[0] if (elems ||= []).size > 0
    end

    # => Coursera::Course.find_many(["Gtv4Xb1-EeS-ViIACwYKVQ", "zfksZy_FEeWWqBIFfWmDPQ"])
    def self.find_many(input, attrs = {})
      attrs = self.prepare_attributes(attrs)
      route = "/courses.v1?ids=".concat(input.map(&:to_s).join(","))
      
      Coursera::Course.batch_request(route, attrs)
    end

    # => Coursera::Course.find_by_slug("machine-learning")
    def self.find_by_slug(input, attrs = {})
      attrs = self.prepare_attributes(attrs)
      elems = self.get_elements("/courses.v1?q=slug&slug=#{input}", {query: attrs})

      Coursera::Course.new elems[0] if (elems ||= []).size > 0
    end

    def start_date
      Time.at(self.startDate / 1000) unless self.startDate.nil?
    end
  end
end