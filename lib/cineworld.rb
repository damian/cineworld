require 'rubygems'
require 'httparty'

module Cineworld
  class API
    include HTTParty
    format :json
    base_uri 'http://www.cineworld.com/api/quickbook'

    def initialize(key)
      @key = key
    end

    def cinemas(options = {})
      options.merge!(:key => @key)
      self.class.get('/cinemas', :query => options)
    end

    def films(options = {})
      options.merge!(:key => @key)
      self.class.get('/films', :query => options)
    end

    def dates(options = {})
      options.merge!(:key => @key)
      self.class.get('/dates', :query => options)
    end

    def performances(options = {})
      options.merge!(:key => @key)
      self.class.get('/performances', :query => options)
    end
  end
end
