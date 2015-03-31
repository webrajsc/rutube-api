require 'rutube/api/request'
require 'rutube/api/response'
require 'rutube/api/url_builder'

module Rutube
  module Api

    def self.request
      Api::Request.new
    end

  end
end
