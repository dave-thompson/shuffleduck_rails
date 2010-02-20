class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.validates_format_of_login_field_options :with => /\A[\w\.\-_]*$/, :message => 'may contain only letters, numbers and the symbols . - _'
  end
  has_many :decks, :dependent => :destroy
  validates_each :age_at_signup do |record, attr, value|
        record.errors.add 'Age', 'is required (it will help us find cards relevant to you)' if value == 0
  end
  
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
