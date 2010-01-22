class DeckDetail < ActiveRecord::Base
  belongs_to :deck
  require 'nokogiri'
  
  def before_save
    doc = Nokogiri::XML(xml_string)
    deck.num_cards = doc.xpath("/Deck/Cards/Card").length
    deck.cover_xml_string = "" # FIX LATER
    deck.save
  end
  
end
