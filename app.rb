require "bundler"
Bundler.require
require "./lib/compliment"
require "yaml"

module Compliments
  class App < Sinatra::Application

    compliments = YAML.load(File.read("./compliments.yaml"))

    images = Dir["./public/images/*"].map {|image| "/images/#{Pathname.new(image).basename}"}

    get "/" do
      redirect "/compliments"
    end

    get "/compliments" do
      @compliment = Compliment.new(compliments.sample, images.sample)

      erb :compliment
    end

  end
end