module Rutube
  class Oembed < DataWrapper

    def self.get(url)
      self.new Api.request.oembed(url: url).make.meta
    end

  end
end
