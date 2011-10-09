class CreateDummy < ActiveRecord::Migration
  def change
    create_table :dummy_tables do |t|
      t.text :dummy1
      t.text :dummy2
      t.text :dummy3

      t.timestamps
    end
  end
end
