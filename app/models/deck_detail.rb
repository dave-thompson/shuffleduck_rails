class DeckDetail < ActiveRecord::Base
  belongs_to :deck
  require 'nokogiri'
  
  def before_save
    doc = Nokogiri::XML(xml_string)
    deck.num_cards = doc.xpath("/Deck/Cards/Card").length
    deck.cover_xml_string = doc.xpath("/Deck/Cards/Card/Side")[0].to_s
    deck.save    
    
  end
  
end
