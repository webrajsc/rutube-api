require 'rutube/searchable'
require 'rutube/configuration'
require 'rutube/data_wrapper'
require 'rutube/person'
require 'rutube/oembed'
require 'rutube/video'
require 'rutube/user'
require 'rutube/tag'
require 'rutube/api'
require 'rutube/tv'

module Rutube

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

end
