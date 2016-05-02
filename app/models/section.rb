class Section < ActiveRecord::Base
  default_scope { order 'section_id, position' }

  has_many :items
  has_many :subsections, class_name: 'Section'

  belongs_to :section

  before_destroy :prevent_destroy_when_posts
  before_destroy :prevent_destroy_when_subsections

  def self.top_level
    Section.where(section_id: nil)
  end

  private

  def prevent_destroy_when_items
    unless items.length < 1
      errors.add(:category, 'cannot delete when items exist for it ')
      false
    end
  end

  def prevent_destroy_when_subsections
    unless subsections.length < 1
      errors.add(:category, 'cannot delete when subsections exist for it ')
      false
    end
  end
end
