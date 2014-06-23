class Section < ActiveRecord::Base

  default_scope order 'section_id, position'

	has_many :items
	has_many :subsections, class_name: "Section"

	belongs_to :section

	def self.cached_sections
		Rails.cache.fetch([name, "sections"], expires_in: 5.minutes) do
			Section.where(section_id: nil).to_a
		end
	end

	def cached_subsections
		Rails.cache.fetch([self, "sections"]) { subsections.to_a }
	end

	def cached_items
		Rails.cache.fetch([self, "items"]) { items.to_a }
	end
end