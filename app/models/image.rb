class Image < ActiveRecord::Base

	belongs_to :item

	has_attached_file :image, styles: { thumb: ["100x100#", :png] }, default_url: "/images/:style/missing.png"

	validates_attachment :image, 	:presence => true,
									content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"] },
									:size => { :in => 0..5.megabytes }

end