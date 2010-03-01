class InboundMailer < ActionMailer::Base
  #default_url_options[:host] = "shuffleduck.heroku.com"
  
  def feedback(username, email, message)
    subject       "Feedback"
    from          email
    recipients    "feedback@shuffleduck.com"
    sent_on       Time.now
    content_type  "text/html"
    body          :message => message, :username => username
  end
  
end
