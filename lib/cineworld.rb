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

    def initialize(key)
        @key = key
        %w{cinemas films performances dates}.each do |methodname|
                self.class.send(:define_method, methodname) do |opts={}|
                opts.merge!(:key => @key)
                self.class.get("/#{methodname}", :query => opts)
            end
        end
    end
  end
end
