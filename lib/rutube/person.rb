module Rutube
  class Person < DataWrapper

    def self.get(person_id)
      self.new Api.request.metainfo.person(person_id).make.meta
    end

  end
end
