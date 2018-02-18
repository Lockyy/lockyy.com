# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  views       :integer          default(0)
#  category_id :integer
#  slug        :string
#  visible     :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#  visible_at  :datetime
#

module Blog
  class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: %i[slugged history finders]

    belongs_to :category

    validates :title, presence: true, uniqueness: :true
    validates :content, presence: true
    validates :category, presence: true
    validates :visible_at, presence: true

    scope :most_viewed, -> { order(:views) }
    scope :visible, -> { where('visible_at < ?', Time.zone.now).where(visible: true) }

    before_validation -> { self.visible_at = Time.zone.now }, if: -> { self.visible_at.nil? },
                                                              on: :create

    def self.recent(number)
      all.last(number)
    end

    def visible?
      visible && (created_at < Time.now)
    end

    def log_visit
      self.views += 1
      save
    end

    def should_generate_new_friendly_id?
      true
    end
  end
end
