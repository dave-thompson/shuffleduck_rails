class ChangeAllBackgroundTransparenciesToTrue < ActiveRecord::Migration
  require 'nokogiri'
    
  def self.up
    for deck_detail in DeckDetail.all
      # change side colours to colour of first textbox on template
      doc = Nokogiri::XML(deck_detail.xml_string)
      bgColor = doc.xpath("/Deck/Template/Card/Side/Component/TextBox/backgroundColor")[0].content
      puts bgColor
      deck_detail.xml_string = deck_detail.xml_string.gsub(/<Side backgroundColor="([^"]*)">/,'<Side backgroundColor="' + bgColor + '">')
      
      # change background transparencies to true
      deck_detail.xml_string = deck_detail.xml_string.gsub('<backgroundTransparent variable="false">false','<backgroundTransparent variable="false">true')
      deck_detail.save
    end
  end

  def self.down
    # not implemented
  end
end
