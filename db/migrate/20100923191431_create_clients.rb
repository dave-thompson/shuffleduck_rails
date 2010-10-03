class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      # human fields
      t.string :name
      t.string :owner
      t.string :owner_email
      t.string :owner_phone
      # login fields
      t.string :api_key, :null => false
      t.string :api_secret, :null => false
      t.string :password_salt
      t.string :persistence_token
      t.string :perishable_token
      # automagical fields (courtesy of authlogic & authlogic_api)
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.integer :request_count
      t.string :last_request_ip
      # automagical fields (courtesy of rails)
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end

# data
# insert into clients (id, name, owner, owner_email, owner_phone, api_key, api_secret) values (1,'Flex App', 'Dave Thompson', 'dave@shuffleduck.com', '+44 7957 174 301', '3000', 'xUoMDKO1iSZPrEC4hY4n')
# insert into clients (id, name, owner, owner_email, owner_phone, api_key, api_secret) values (2,'iPhone App', 'Dave Thompson', 'dave@shuffleduck.com', '+44 7957 174 301', '3001', 'Hn2Gro0wseeoslZYE3ng')