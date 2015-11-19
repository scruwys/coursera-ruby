require "coursera/base"

module Coursera
  class Client < Coursera::Base

    # => client = Coursera::Client.new
    def initialize(options = {})
      @options = options
    end
  end
end