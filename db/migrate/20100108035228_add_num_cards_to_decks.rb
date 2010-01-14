class AddNumCardsToDecks < ActiveRecord::Migration

  def self.up
    add_column "decks", "num_cards", :integer
  end

  def self.down
    remove_column "decks", "num_cards"
  end
end
