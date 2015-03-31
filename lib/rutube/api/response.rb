require 'oj'

module Rutube
  module Api

    class Response

      attr_reader :data, :meta

      def initialize(response_data)
        parse_result = ::Oj.load response_data
        @data = parse_result.delete 'results'
        @meta = parse_result
      end

      %w(page per_page count).each do |method_name|
        define_method method_name do
          meta[method_name]
        end
      end

      def next
        next_response = next_url && @next ||= Request.new(next_url).make || nil
        next_response.instance_variable_set :@prev, self if next_response
        next_response
      end

      def prev
        prev_response = prev_url && @prev ||= Request.new(prev_url).make || nil
        prev_response.instance_variable_set :@next, self if prev_response
        prev_response
      end

      def next_url
        meta['next']
      end

      def prev_url
        meta['previous']
      end

      def has_next?
        meta['has_next']
      end

      def inspect
        meta
      end

      def each(&block)
        data.each &block
      end

      def each!(&block)
        response = self
        while response
          response.each &block
          response = response.next
        end
      end

      def map(&block)
        data.map &block
      end

      def map!(&block)
        result = []
        each! do |item|
          result << yield(item)
        end
        result
      end

    end

  end
end
