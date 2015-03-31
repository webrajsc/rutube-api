module Rutube
  module Searchable

    def self.included(klass)

      klass.class_eval do

        def self.searchable(resource_name)
          self.class_variable_set :@@searchable, resource_name
        end

        def self.search(query, params={})
          params = params.dup
          params[:query] = query
          Api.request.search.public_send(self.class_variable_get(:@@searchable), params).make.map! do |data|
            self.new data
          end
        end

      end

    end

  end
end
