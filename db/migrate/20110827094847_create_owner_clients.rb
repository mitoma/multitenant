class CreateOwnerClients < ActiveRecord::Migration
  def self.up
    create_table :owner_clients do |t|
      t.integer :database_id
      t.text :name
      t.text :domain
      t.text :status

      t.timestamps
    end
  end

  def self.down
    drop_table :owner_clients
  end
end
