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

  def get_images
    compliments = html.search(".alignnone").map do |item|
      uri = item['src']
      File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read)}
    end
    
    # File.open("compliments.yaml", "w") do |file|
      # file.puts YAML::dump(compliments)
    # end
  end

end

# test = Scraper.new("http://www.pinterest.com/myrlie93/365-quotes-sayings-and-compliments-from-my-best-fr/")
# test.get_compliments

test = Scraper.new("http://www.demilked.com/men-and-cats-similar-poses/")
p test.get_images