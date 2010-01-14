class RemoveXmlStringFromDeck < ActiveRecord::Migration
  def self.up
    remove_column :decks, :xml_string
  end

  def self.down
    add_column :decks, :xml_string, :string
  end
end
