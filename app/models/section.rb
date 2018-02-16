# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  position    :integer
#  section_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Section < ApplicationRecord
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
    unless items.empty?
      errors.add(:category, 'cannot delete when items exist for it ')
      false
    end
  end

  def prevent_destroy_when_subsections
    unless subsections.empty?
      errors.add(:category, 'cannot delete when subsections exist for it ')
      false
    end
  end
end
