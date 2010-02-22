xml.password_reset do
  xml.status(@status)
  xml.message(@message) if @message
end