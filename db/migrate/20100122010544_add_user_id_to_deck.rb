class AddUserIdToDeck < ActiveRecord::Migration
  def self.up
    rename_column :decks, :owner_account_id, :user_id
  end

  def self.down
    rename_column :decks, :user_id, :owner_account_id
  end
end
