class ChangeXmlStringToText < ActiveRecord::Migration
  def self.up
    change_column :decks, :cover_xml_string, :text
    change_column :deck_details, :xml_string, :text
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration # reverting to previous type (:string, aka varchar(255)) may result in data loss
  end
end
