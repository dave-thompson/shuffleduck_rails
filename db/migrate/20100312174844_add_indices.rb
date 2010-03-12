class AddIndices < ActiveRecord::Migration
  def self.up
    add_index :deck_details, :deck_id, :unique => true
    add_index :decks, [:user_id, :last_saved_date]
    add_index :decks, :user_visible_id, :unique => true
    add_index :users, :email, :unique => true
  end

  def self.down
    remove_index :deck_details, :deck_id
    remove_index :decks, [:user_id, :last_saved_date]
    remove_index :decks, :user_visible_id
    remove_index :users, :email
  end
end
