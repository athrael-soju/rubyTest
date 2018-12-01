require 'nokogiri'

class PagesController < ApplicationController
  def about
  end

  def home
    update()
  end

  def contact
  end

  def update
    doc = Nokogiri::XML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"))

    doc.xpath("//xmlns:Cube/xmlns:Cube/xmlns:Cube").each do |row|
      currency = row.attribute('currency')
      rate = row.attribute('rate')
      timeNow = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')

      sql = "UPDATE forexes SET rate=#{rate}, updated_at='#{timeNow}' WHERE currency ='#{currency}'"
      ActiveRecord::Base.connection.execute(sql)
    end
  end
end
