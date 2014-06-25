class BlogCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged]

  has_many :blog_posts

  validates :title, presence: true

end
