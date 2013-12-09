require "bundler"
Bundler.require
require "./lib/compliment.rb"

module Compliments
  class App < Sinatra::Application

    compliments=["message1", "message2", "message3"]

    get "/compliments" do
      @compliment = Compliment.new(compliments.sample)

      erb :compliment
    end

  end
end