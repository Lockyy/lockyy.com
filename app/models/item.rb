class Item < ActiveRecord::Base

  default_scope order 'section_id, position'

	has_many :images

	belongs_to :section, touch: true

  validates :section_id, presence: true

	def cached_images
		Rails.cache.fetch([self, "images"]) { images.to_a }
	end
end