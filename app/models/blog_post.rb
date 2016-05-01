class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  default_scope order 'date_posted DESC'

  belongs_to :blog_category

  validates :title, presence: true
  validates :content, presence: true

  before_create :set_date_posted

  def self.viewable
    where('date_posted < ?', Time.now).where(published: true)
  end

  def viewable?
    published && (date_posted < Time.now)
  end

  def self.category_find(category)
    category = BlogCategory.friendly.find_by_slug(category)
    BlogPost.viewable.where(blog_category_id: category.id) if category
  end

  def set_date_posted
    self.date_posted = created_at unless date_posted
  end

  def log_visit
    self.views += 1
    save
  end
end
