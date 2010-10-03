xml.deck do
  xml.timestamp(Time.now.to_formatted_s(:w3cdtf))
  xml.title(@deck[:title])
  xml.author(@author)
  xml.user_visible_id(@deck[:user_visible_id])
end