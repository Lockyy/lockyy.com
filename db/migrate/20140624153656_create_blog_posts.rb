class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.text :title
      t.text :content
      t.integer :views, default: 0
      t.integer :blog_category_id
      t.datetime :date_posted

      t.timestamps
    end
  end
end
