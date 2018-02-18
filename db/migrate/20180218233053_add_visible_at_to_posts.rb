class AddVisibleAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :visible_at, :datetime

    Blog::Post.find_each do |post|
      post.update(visible_at: post.created_at)
    end
  end
end
