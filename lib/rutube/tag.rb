module Rutube
  class Tag < DataWrapper

    searchable :tags

    def self.all
      Api.request.tags.make.map! do |tag_data|
        self.new tag_data
      end
    end

  end
end
