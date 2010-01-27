xml.mindegg_error do
  xml.timestamp(Time.now)
  xml.title(@deck[:title])
  xml.author(@author)
  xml.user_visible_id(@deck[:user_visible_id])
end