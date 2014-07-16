class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  default_scope order 'date_posted DESC'

  belongs_to :blog_category

  validates :title, presence: true
  validates :content, presence: true

  after_create :set_date_posted

  def self.viewable
    where('date_posted < ?', Time.now).where(published: true)
  end

  def self.category_find(category)
    category = BlogCategory.friendly.find_by_slug(category)
    if category
      BlogPost.viewable.where(blog_category_id: category.id)
    end
  end

  def viewable?
    published && (date_posted < Time.now)
  end

  def set_date_posted
    unless date_posted
      date_posted = Time.now
      self.save
    end
  end
  
  def log_visit
    self.views += 1
    self.save
  end

  def published_ascii
    if published
      "✓"
    else
      "X"
    end
  end

  def viewable_ascii
    if viewable? 
      "✓"
    else
      "X"
    end
  end

end
