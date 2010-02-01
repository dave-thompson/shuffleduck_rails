xml.mindegg_error do
  xml.timestamp(Time.now)
  xml.logon_succeeded(@error[:logon_succeeded]) if defined?(@error[:logon_succeeded])
  xml.description(@error[:description])
end