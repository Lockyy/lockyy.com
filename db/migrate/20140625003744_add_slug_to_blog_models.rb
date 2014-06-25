class AddSlugToBlogModels < ActiveRecord::Migration
  def change
    add_column :blog_posts, :slug, :string
    add_index :blog_posts, :slug
    
    add_column :blog_categories, :slug, :string
    add_index :blog_categories, :slug
  end
end
