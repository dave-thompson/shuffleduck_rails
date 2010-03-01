class FeedbacksController < ApplicationController
  
  def create

    # send feedback mail
    email = params[:feedback][:email].strip
    email = "annonymous@shuffleduck.com" if !(email =~ email_regex)
    if current_user
      username = current_user.username
      logger.debug username
    else
      username = "User not logged in"
      logger.debug username
    end
    InboundMailer.deliver_feedback(username, email, params[:feedback][:message].strip)

    # return success
    render :template =>'feedbacks/create.xml.builder'

  end

  private
  def email_regex
    return @email_regex if @email_regex
    email_name_regex  = '[A-Z0-9_\.%\+\-]+'
    domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
    domain_tld_regex  = '(?:[A-Z]{2,4}|museum|travel)'
    @email_regex = /^#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}$/i
  end

end