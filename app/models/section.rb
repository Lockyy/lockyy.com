class Section < ActiveRecord::Base

	has_many :items
	has_many :subsections, class_name: "Section"

	belongs_to :section

end