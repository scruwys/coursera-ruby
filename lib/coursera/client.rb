require "coursera/base"
require "coursera/course"

module Coursera
  class Client < Coursera::Base

    # => client = Coursera::Client.new
    def initialize(options = {})
      @options = options
    end
  end
end