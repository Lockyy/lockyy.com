class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :item_id
      t.text :description
      t.integer :order
      
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end