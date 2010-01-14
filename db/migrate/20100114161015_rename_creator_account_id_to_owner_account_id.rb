class RenameCreatorAccountIdToOwnerAccountId < ActiveRecord::Migration
  def self.up
    rename_column :decks, :creator_account_id, :owner_account_id
  end

  def self.down
    rename_column :decks, :owner_account_id, :creator_account_id
  end
end
