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
#

module Blog
  class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: %i[slugged history finders]

    belongs_to :category

    validates :title, presence: true, uniqueness: :true
    validates :content, presence: true
    validates :category, presence: true

    scope :most_viewed, -> { order(:views) }

    def self.recent(number)
      all.last(number)
    end

    def self.visible
      where('created_at < ?', Time.now).where(visible: true)
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
