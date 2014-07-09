class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  default_scope order 'date_posted DESC'

  belongs_to :blog_category

  validates :title, presence: true
  validates :content, presence: true

  after_create :set_date_posted

  def self.category_find(category)
    category = BlogCategory.friendly.find_by_slug(category)
    if category
      BlogPost.where(blog_category_id: category.id)
    end
  end

  def set_date_posted
    unless date_posted
      date_posted = time.now
      self.save
    end
  end
  
  def log_visit
    self.views += 1
    self.save
  end

end
