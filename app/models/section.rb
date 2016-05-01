class Section < ActiveRecord::Base
  default_scope order 'section_id, position'

  has_many :items
  has_many :subsections, class_name: 'Section'

  belongs_to :section

  def self.cached_sections
    Rails.cache.fetch([name, 'sections'], expires_in: 5.minutes) do
      Section.where(section_id: nil).to_a
    end
  end

  def cached_subsections
    Rails.cache.fetch([self, 'sections']) { subsections.to_a }
  end

  def cached_items
    Rails.cache.fetch([self, 'items']) { items.to_a }
  end

  # This returns the valid sections that the current section can go under.
  def valid_sections_for_collection_select
    # First we remove the current section
    result = Section.all - [self]

    result.each do |result_section|
      section = result_section
      while section
        if section == self
          result -= [result_section]
          break
        end
        section = section.section
      end
    end

    result
  end
end
