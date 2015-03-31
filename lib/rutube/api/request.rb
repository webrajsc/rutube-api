module Rutube
  module Api

    class Request

      def initialize(url=nil, request_params={})
        @url = url
        @url_builder = Api::UrlBuilder.new request_params
      end

      def method_missing(method_name, *attrs)
        @url_builder.public_send method_name, *attrs
        self
      end

      def make
        url = @url || @url_builder.inspect
        puts "Performing request: #{url}"
        @response ||= Response.new open(url).read
      end

    end

  end
end
