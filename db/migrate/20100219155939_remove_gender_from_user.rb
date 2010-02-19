class RemoveGenderFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :gender
  end

  def self.down
    add_column :users, :gender, :string
  end
end
