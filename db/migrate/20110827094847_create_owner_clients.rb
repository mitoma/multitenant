class CreateOwnerClients < ActiveRecord::Migration
  def change
    create_table :owner_clients do |t|
      t.integer :database_id
      t.text :name
      t.text :domain
      t.text :status

      t.timestamps
    end
  end
end
