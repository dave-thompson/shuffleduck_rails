xml.decks do
  xml.timestamp(Time.now.to_formatted_s(:w3cdtf))
  @decks.each do |deck|
    xml.deck do
      xml.user_visible_id(deck.user_visible_id)
      xml.title(deck.title)
      xml.author(deck.user.username)
      xml.num_cards(deck.num_cards)
      xml.last_saved_date(deck.last_saved_date.to_formatted_s(:w3cdtf))
      xml.cover_xml_string(deck.cover_xml_string)
    end
  end
end