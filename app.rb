require "bundler"
Bundler.require
require "./lib/compliment"
require "./lib/scraper"

module Compliments
  class App < Sinatra::Application

    compliments = Scraper.new("http://www.pinterest.com/myrlie93/365-quotes-sayings-and-compliments-from-my-best-fr/").get_compliments

    get "/compliments" do
      @compliment = Compliment.new(compliments.sample)

      erb :compliment
    end

  end
end