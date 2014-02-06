# encoding: UTF-8
require 'open-uri'
require 'nokogiri'
require 'iconv'

class GetRate
  def initialize(link, encoding)
    @html_link = link
    @html_encoding = encoding
    
    read_doc()
  end
  
  def read_doc()
    if @html_encoding != 'utf-8'
      html_utf8 = Iconv.conv('utf-8', @html_encoding, open(@html_link).read)
    else
      html_utf8 = open(@html_link).read
    end
    
    @doc = Nokogiri::HTML(html_utf8)
  end
end