class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # vital statistics fields
      t.string :email, :null => false
      t.integer :age_at_signup, :null => false
      t.string :gender, :null => false
      # login fields
      t.string :username, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.string :perishable_token
      # automagical fields (courtesy of authlogic)
      t.integer :login_count, :default => 0, :null => false
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at      
      t.string :current_login_ip
      t.string :last_login_ip
      # automagical fields (courtesy of rails)
      t.timestamps
    end        
    add_index :users, :username
    add_index :users, :persistence_token
  end

  def self.down
    drop_table :users
  end
end
