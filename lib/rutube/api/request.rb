module Rutube
  module Api

    class Request

      attr_reader :response

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
        begin
          @response ||= Response.new open(url).read
        rescue Errno::ECONNREFUSED
          raise Errors::ConnectionRefused
        end
      end

    end

  end
end
