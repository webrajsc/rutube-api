module Rutube
  class Configuration
    attr_accessor :concurrency

    def initialize
      @concurrency = 1
    end

  end
end
