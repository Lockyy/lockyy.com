class Section < ActiveRecord::Base

	has_many :items
	has_many :subsections, class_name: "Section"

	belongs_to :section

	def self.cached_sections
		Rails.cache.fetch([name, "sections"], expires_in: 5.minutes) do
			Section.order(:order).where(section_id: nil).to_a
		end
	end

	def cached_subsections
		Rails.cache.fetch([self, "sections"]) { subsections.order(:order).to_a }
	end

	def cached_items
		Rails.cache.fetch([self, "items"]) { items.order(:order).to_a }
	end
end