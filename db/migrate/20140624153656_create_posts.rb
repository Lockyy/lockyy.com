class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title
      t.text     :content
      t.integer  :views, default: 0
      t.integer  :category_id
      t.string   :slug
      t.boolean  :visible, default: false

      t.timestamps
    end

    add_index :posts, :slug
  end
end
