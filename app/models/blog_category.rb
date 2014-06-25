class BlogCategory < ActiveRecord::Base

  has_many :blog_posts

  validates :title, presence: true

end
