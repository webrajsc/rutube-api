module Rutube
  class Video < DataWrapper

    searchable :video

    def self.get(video_id)
      self.new Api.request.video(video_id).make.meta
    end

    def self.by_person(person_id)
      Api.request.video.person(person_id).make.map! do |video_data|
        self.new video_data
      end
    end

    def self.by_tag(tag_id)
      Api.request.tags.video(tag_id).make.map! do |video_data|
        self.new video_data
      end
    end

    def self.by_tv(tv_id, filter={})
      filter = filter.dup
      filter[:type] = Tv::CONTENT_TYPES[filter[:type]] if filter[:type] && filter[:type].is_a?(Symbol)
      Api.request.metainfo.tv(tv_id).video(filter).make.map! do |video_data|
        self.new video_data
      end
    end

    def oembed
      @oembed ||= Oembed.get video_url
    end

  end
end
