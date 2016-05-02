class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :section_id
      t.string  :name
      t.text    :content
      t.string  :link
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end