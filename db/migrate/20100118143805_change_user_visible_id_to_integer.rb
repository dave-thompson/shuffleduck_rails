class ChangeUserVisibleIdToInteger < ActiveRecord::Migration
  def self.up
    change_column :decks, :user_visible_id, :integer
  end

  def self.down
    change_column :decks, :user_visible_id, :string
  end
end
