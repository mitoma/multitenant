class CreateDummy < ActiveRecord::Migration
  def self.up
    create_table :dummy_table do |t|
      t.text :dummy1
      t.text :dummy2
      t.text :dummy3

      t.timestamps
    end
  end

  def self.down
    drop_table :dummy_table
  end
end
