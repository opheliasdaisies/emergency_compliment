require "bundler"
Bundler.require
require "./lib/compliment"
require "yaml"

module Compliments
  class App < Sinatra::Application

    compliments = YAML.load(File.read("./compliments.yaml"))

    get "/compliments" do
      @compliment = Compliment.new(compliments.sample)

      erb :compliment
    end

  end
end