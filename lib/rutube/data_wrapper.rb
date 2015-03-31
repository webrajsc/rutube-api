module Rutube

    class DataWrapper

      include Searchable

      def initialize(data)
        @data = data
      end

      def method_missing(method_name)
        @data[method_name.to_s]
      end

      def inspect
        @data
      end

    end

end
