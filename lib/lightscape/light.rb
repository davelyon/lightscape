require 'rest_client'
require 'json'

module Lightscape
  class Light
    def self.find number
      new(number)
    end

    # The API client interface to the light
    attr_reader :client

    # A hash of pending changes to the light
    # E.g. { on: true }
    attr_accessor :pending_changes

    def initialize number
      @client = Lightscape::Client.base["lights/#{number}"]
      @pending_changes = {}
    end

    def on= boolean
      pending_changes[:on] = boolean
    end

    def on!
      self.on = true
      update!
    end

    def off!
      self.on = false
      update!
    end

    def color= symbol
      self.on = true
      pending_changes[:xy] = COLORS[symbol]
    end

    def transition_time= duration
      pending_changes[:transitiontime] = duration
    end

    def brightness= number
      self.on = true
      pending_changes[:bri] = [0, [number, 255].min].max
    end

    # If you really want to use the same interface as the API
    alias_method :bri=, :brightness=

    def update!
      response = client["/state"].put pending_changes.to_json
      pending_changes = {}
      raise response.to_str unless response =~ /success/
      true
    end
  end
end
