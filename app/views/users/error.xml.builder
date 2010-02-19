xml.registration_error do
  xml.timestamp(Time.now)
  xml.username_clash(@error[:username_clash]) # true iff the requested username already exists and false if either it doesn't exist or its existence wasn't confirmed
  xml.inappropriate_password(@error[:inappropriate_password])
  xml.inappropriate_username(@error[:inappropriate_username])
  xml.age_not_supplied(@error[:age_not_supplied])
  xml.description(@error[:description])
end