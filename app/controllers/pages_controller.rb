require 'nokogiri'

class PagesController < ApplicationController
  def about
  end

  def home
    update
  end

  def contact
  end

  def update
    doc = Nokogiri::XML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"))
    time_now = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
    doc.xpath("//xmlns:Cube/xmlns:Cube/xmlns:Cube").each do |row|
      currency = row.attribute('currency')
      rate = row.attribute('rate')
      update_forex = "UPDATE forexes SET rate=#{rate}, updated_at='#{time_now}' WHERE currency ='#{currency}'"
      ActiveRecord::Base.connection.execute(update_forex)
    end
  end
end
