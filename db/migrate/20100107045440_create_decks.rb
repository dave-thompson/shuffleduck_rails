class CreateDecks < ActiveRecord::Migration
  def self.up
    create_table :decks do |t|
      t.integer :creator_account_id
      t.string :user_visible_id
      t.string :title
      t.string :xml_string
      t.string :cover_xml_string
      t.datetime :last_saved_date

      t.timestamps
    end
  end

  def self.down
    drop_table :decks
  end
end
