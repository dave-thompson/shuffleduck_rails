class UserMailer < ActionMailer::Base
  default_url_options[:host] = "localhost:3000" #"shuffleduck.heroku.com"
  
  def password_reset_instructions(user)
    subject       "Password Reset Request"
    from          "dave_thompson@mba.berkeley.edu"#"support@shuffleduck.com"
    recipients    "feedback@shuffleduck.com" #user.email
    sent_on       Time.now
    content_type  "multipart/alternative"
    
    # rails bug #2338 requires the following workaround to send both plain text and html email
    part :content_type => "text/plain", :body => render_message("password_reset_instructions.text.plain", :edit_password_reset_url => edit_password_reset_url(user.perishable_token), :username => user.username)
    part :content_type => "text/html", :body => render_message("password_reset_instructions.text.html", :edit_password_reset_url => edit_password_reset_url(user.perishable_token), :username => user.username)    
            
  end
  
end
