require "open-uri"
require "nokogiri"

class Scraper
  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
  end

  def get_compliments
    complements = html.search('.pinDescription').map do |item|
      item.text.gsub(/\d+\.\s/, "")
    end
  end

end