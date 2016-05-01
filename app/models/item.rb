class Item < ActiveRecord::Base

  default_scope order 'section_id, position'

	belongs_to :section, touch: true

  validates :section_id, presence: true
end