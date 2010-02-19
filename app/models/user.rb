class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
    # the below validation is done in the controller so as to give friendly XML error messages
    # not the the format reg_exp ha also been changed there, but not here.
    #c.validates_format_of_login_field_options :with => /\A\w[\w\.+\-_]+$/, :message => 'should use only letters, numbers, periods, dashes and underscores please.'
    #c.validates_length_of_login_field_options :minimum => 6, :message => "should be at least 3 characters long please."
    #c.validates_length_of_login_field_options :maximum => 30, :message => "should be no more than 30 characters long please."
  end
  has_many :decks, :dependent => :destroy
  #validates_uniqueness_of :username # already handled by authlogic (I think)
  
  def add_deck (title, xml_string)
    # create deck
    deck = Deck.new
    deck.user = self
    # populate simple fields
    deck.title = title
    deck.last_saved_date = Time.now
    # create deck_detail
    deck.deck_detail = DeckDetail.new(:xml_string => xml_string)
    # save deck and return it
    Deck.transaction do
      deck.save && deck.deck_detail.save
      deck
    end
  end
  
end
