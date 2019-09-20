# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  created_at :datetime
#  updated_at :datetime
#

module Blog
  class Category < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: %i[slugged finders]

    has_many :posts

    validates :title, presence: true, uniqueness: true, length: { maximum: 40 }

    before_destroy :prevent_destroy_when_posts

    private

    def prevent_destroy_when_posts
      return if posts.empty?

      errors.add(:category, 'cannot delete when posts exist for it ')
      false
    end

    def should_generate_new_friendly_id?
      true
    end
  end
end
