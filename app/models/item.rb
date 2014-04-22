class Item < ActiveRecord::Base

	has_many :images

	belongs_to :section

end