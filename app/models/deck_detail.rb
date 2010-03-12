class DeckDetail < ActiveRecord::Base
  attr_accessible :xml_string
  belongs_to :deck
  require 'nokogiri'
  
  def before_save
    doc = Nokogiri::XML(xml_string)
    deck.num_cards = doc.xpath("/Deck/Cards/Card").length
    deck.cover_xml_string = doc.xpath("/Deck/Cards/Card/Side")[0].to_s
    if deck.cover_xml_string == ""
      deck.cover_xml_string = '<Side backgroundColor="16777215"/>' #blank white side
    end
    deck.save    
    
  end
  
end
