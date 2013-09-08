require "lightscape/version"
require "lightscape/light"

module Lightscape
  module Client
    extend self
    attr_writer :bridge, :user

    def base
      @base ||= RestClient::Resource.new "http://#{bridge}/api/#{user}"
    end

    def bridge
      @bridge ||= ENV.fetch("BRIDGE")
    end

    def user
      @user ||= ENV.fetch("HUE_USER", "rubyclient")
    end
  end

  # Red: 0.675, 0.322
  # Green: 0.4091, 0.518
  # Blue: 0.167, 0.04

  COLORS = {
      red: [0.675, 0.322],
      green: [0.4077, 0.5154],
      blue: [0.167, 0.04],
      white: [0.4440, 0.3500]
  }.tap { |hsh| hsh.default [0.4440, 0.3500] }
end
