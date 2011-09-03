class CreateOwnerDatabases < ActiveRecord::Migration
  def change
    create_table :owner_databases do |t|
      t.text :name
      t.text :hostname
      t.integer :port
      t.text :username
      t.text :password

      t.timestamps
    end
  end
end
