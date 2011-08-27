class CreateOwnerDatabases < ActiveRecord::Migration
  def self.up
    create_table :owner_databases do |t|
      t.text :name
      t.text :hostname
      t.integer :port
      t.text :username
      t.text :password

      t.timestamps
    end
  end

  def self.down
    drop_table :owner_databases
  end
end
