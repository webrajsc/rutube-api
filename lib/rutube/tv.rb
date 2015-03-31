module Rutube
  class Tv < DataWrapper

    CONTENT_TYPES = {
        episode: 2,
        trailer: 3,
        bonusfeatures: 4,
        cover: 5,
        part: 6,
        special: 7,
        highlight: 8,
        goal: 9,
        interview: 10
    }

    def self.all
      Api.request.metainfo.tv.make.map! do |tv_data|
        self.new tv_data
      end
    end

    def self.get(tv_id)
      self.new Api.request.metainfo.tv(tv_id).make.meta
    end

  end
end
