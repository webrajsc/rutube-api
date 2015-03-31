require 'uri'

module Rutube

  module Api

    class UrlBuilder

      BASE_URL = 'http://rutube.ru/api'
      DEFAULT_PARAMS = {
          format: :json
      }

      attr_reader :target_url, :params

      def initialize(additional_params={})
        @target_url = BASE_URL
        @params = DEFAULT_PARAMS.merge additional_params
      end

      def method_missing(method_name, *attrs)
        params.merge! extract_options_from attrs
        join method_name
        join attrs.first if attrs.any?
        self
      end

      def inspect
        result = "#{@target_url}"
        result += '/?' + URI.encode_www_form(params) if params.any?
        result
      end

      private

        def join(something)
          @target_url = File.join @target_url, something.to_s
        end

        def extract_options_from(array)
          array.last.is_a?(::Hash) ? array.pop : {}
        end

    end

  end

end
