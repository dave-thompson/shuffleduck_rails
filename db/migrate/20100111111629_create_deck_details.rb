class CreateDeckDetails < ActiveRecord::Migration
  def self.up
    create_table :deck_details do |t|
      t.integer :deck_id
      t.string :xml_string

      t.timestamps
    end
  end

  def self.down
    drop_table :deck_details
  end
end
