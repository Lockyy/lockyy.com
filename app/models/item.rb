class Item < ActiveRecord::Base

	has_many :images

	belongs_to :section, touch: true

	def cached_images
		Rails.cache.fetch([self, "images"]) { images.order(:order).to_a }
	end
end