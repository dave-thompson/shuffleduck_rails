xml.error do
  xml.timestamp(Time.now.to_formatted_s(:w3cdtf))
  xml.logon_succeeded(@error[:logon_succeeded]) if defined?(@error[:logon_succeeded])
  xml.description(@error[:description])
end