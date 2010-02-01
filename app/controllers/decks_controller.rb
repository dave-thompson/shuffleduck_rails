class DecksController < ApplicationController
  # GET /decks
  # List all of a user's decks
  def index
    if current_user
      @decks = current_user.decks.find(:all, :order => "last_saved_date DESC")
      render :template =>'decks/index.xml.builder'
    else
      @error = {:logon_succeeded => false, :description => "Couldn't log you in. Please check your username and password."}
      render :template => 'errors/error.xml.builder'
    end      
  end

  # GET /decks/1
  # Return a specific deck
  def show
    @deck = Deck.find(:first, :conditions => ["user_visible_id = ?", params[:id]])
    if @deck
      @author = @deck.user.username
      render :template =>'decks/show.xml.builder'
    else
      @error = {:description => "Couldn't find deck with Deck ID #{params[:id]}."}
      render :template => 'errors/error.xml.builder'
    end
  end
  
  
=begin
  def show
    if current_user
      @deck = current_user.decks.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id
      if @deck
        render :xml => @deck.to_xml(:dasherize => false)
      else
        @error = {:description => "Sorry, you don't have privileges to downlod deck #{params[:id]}"}
        render :template => 'errors/show.xml.builder'
      end
    else
      @error = {:description => "Couldn't log you in. Please check your username and password."}
      render :template => 'errors/show.xml.builder'
    end
  end
=end

  # POST /decks
  # Create a new deck with the given parameters
  def create
    @deck = current_user.add_deck params[:deck][:title], params[:deck][:xml_string]
    # we should check deck and deck.deck_detail for errors really here, rather than just sending back the new deck
    render :xml => @deck.to_xml(:dasherize => false), :status => :created, :location => @deck
  end

  # PUT /decks/1
  # Update a specific deck with the given parameters
  def update
    @deck = current_user.decks.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id

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
  # Delete a specific deck
  def destroy
    @deck = current_user.decks.find(:first, :conditions => ["user_visible_id = ?", params[:id]]) # the id supplied in the URL is not actually a deck_id, it is really a user_visible_id
    @deck.destroy
    head :ok
  end
      
end
