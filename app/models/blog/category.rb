class Blog::Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :posts

  validates :title, presence: true, uniqueness: :true, length: { maximum: 40 }

  before_destroy :prevent_destroy_when_posts

  private

  def prevent_destroy_when_posts
    unless posts.length < 1
      errors.add(:category, 'cannot delete when posts exist for it ')
      false
    end
  end

  def should_generate_new_friendly_id?
    true
  end
end
