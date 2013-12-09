require "open-uri"
require "nokogiri"
require "yaml"

class Scraper
  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
  end

  def get_compliments
    compliments = html.search('.pinDescription').map do |item|
      item.text.gsub(/\d+\.\s/, "")
    end
    
    File.open("compliments.yaml", "w") do |file|
      file.puts YAML::dump(compliments)
    end
  end

end

test = Scraper.new("http://www.pinterest.com/myrlie93/365-quotes-sayings-and-compliments-from-my-best-fr/")
test.get_compliments