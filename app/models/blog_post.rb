class BlogPost < ActiveRecord::Base

  belongs_to :blog_category

  validates :title, presence: true
  validates :content, presence: true

  after_create :set_date_posted

  def self.category_find(category)
    category = BlogCategory.find_by(category)
    BlogPost.where(blog_category_id: category.id)
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
