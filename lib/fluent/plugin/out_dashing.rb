require 'httparty'

module Fluent
  class Fluent::DashingOutput < Fluent::Output
    Fluent::Plugin.register_output('dashing', self)

    def initialize
      super
    end

    config_param :dashing_url, :string
    config_param :auth_token, :string
    config_param :event_json_data_key, :string
    config_param :name_key, :string

    def configure(conf)
      super

    end

    def start
      super

    end

    def shutdown
      super

    end

    def emit(tag, es, chain)
      es.each {|time,record|
        next unless value = record[@name_key]

        body = {}
        body[:auth_token] = @auth_token
        body[@event_json_data_key] = value.to_s
        HTTParty.post(@dashing_url, :body => body.to_json)
      }

      chain.next
    end
  end
end
