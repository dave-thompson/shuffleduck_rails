xml.logon_error do
  xml.timestamp(Time.now)
  xml.username_password_invalid(@error[:username_password_invalid]) if defined?(@error[:logon_succeeded])
  xml.description(@error[:description])
end