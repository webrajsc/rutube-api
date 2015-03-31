module Rutube
  class User < DataWrapper

    searchable :authors

    def self.get(user_id)
      self.new Api.request.profile.user(user_id).make.meta
    end

  end
end
