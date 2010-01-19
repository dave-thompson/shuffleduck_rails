class DecksController < ApplicationController
  
  require 'nokogiri'
  
  # GET /decks
  # GET /decks.xml
  # List all of a user's decks
  # THIS SHOULD BE MODIFIED TO SEND ONLY THE NECESSARY INFORMATION - NOT THE FULL DECK XML STRING FOR EVERY DECK!
  def index
    @decks = Deck.find(:all, :order => "last_saved_date DESC")
    render :xml => @decks.to_xml(:dasherize=>false)
  end

  # GET /decks/1
  # GET /decks/1.xml
  # Return a specific deck
  def show
    @deck = Deck.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id
    render :xml => @deck.to_xml(:dasherize => false)
  end

  # POST /decks
  # POST /decks.xml
  # Create a new deck with the given parameters
  def create
    @deck = Deck.new
      @deck.title = params[:deck][:title]
      @deck.deck_detail = DeckDetail.new(:xml_string => params[:deck][:xml_string])

      # we store the server time as the last_saved_date; it's up to the client to work out what this is in user time
      # (to facilitate this, rails must send the user the current timestamp with each response - TO IMPLEMENT)
      @deck.last_saved_date = Time.now
      @deck.owner_account_id = 1

      # derive redundant fields
      doc  = Nokogiri::XML(@deck.deck_detail.xml_string)
      @deck.num_cards = doc.xpath("/Deck/Cards/Card").length
      @deck.cover_xml_string = "" # FIX LATER
    
    if save_deck_and_deck_details_and_assign_user_visible_id
      # next line only renders errors for deck - really it should also render errors for deck_details too, which may have caused the error
      render :xml => @deck.to_xml(:dasherize => false), :status => :created, :location => @deck
    else
      render :xml => @deck.errors, :status => :unprocessable_entity
    end
  end

  # PUT /decks/1
  # PUT /decks/1.xml
  # Update a specific deck with the given parameters
  def update
    @deck = Deck.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id

    @deck.last_saved_date = Time.now
    
    if (params[:deck][:title])
      @deck.title = params[:deck][:title]
    else
      logger.debug "TITLE NOT FOUND"
    end

    if @deck.save
      head :ok
    else
      render :xml => @deck.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.xml
  # Delete a specific deck
  def destroy
    @deck = Deck.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id
    @deck.destroy
    head :ok
  end
    
protected
  def save_deck_and_deck_details_and_assign_user_visible_id
    Deck.transaction do
        success = @deck.save && @deck.deck_detail.save
        @deck.user_visible_id = ((@deck.id + 3000)*10000) + rand(10000)
        success && @deck.save
      end
  end
    
end
