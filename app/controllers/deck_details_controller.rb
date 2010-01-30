class DeckDetailsController < ApplicationController
  before_filter :get_deck_and_deck_detail
  before_filter :require_user

  # GET decks/1/deck_details/1.xml
  # Note that the deck_detail_id supplied is ignored. Only the deck_id is relevant.
  # (In fact, the client has no way of knowing the deck_detail_id.)
  def show
    render :xml => @deck_detail.to_xml(:dasherize => false)
  end

  # PUT decks/1/deck_details/1.xml
  def update
    @deck_detail.xml_string = params[:deck_detail][:xml_string]
    logger.debug Time.now
    @deck.last_saved_date = Time.now
    logger.debug @deck.id
    logger.debug @deck.last_saved_date
    if save_deck_and_deck_details
      head :ok
    else
      # next line only renders errors for deck_details - really it should also render errors for deck, which may have caused the error
      render :xml => @deck_detail.errors, :status => :unprocessable_entity
    end
  end

protected
  def save_deck_and_deck_details
    DeckDetail.transaction do
        @deck_detail.save && @deck.save
      end
  end
  
  def get_deck_and_deck_detail
    @deck = Deck.find(:first, :conditions => ["user_visible_id = ?", params[:deck_id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id    
    @deck_detail = @deck.deck_detail
  end

end
