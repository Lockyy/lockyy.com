class Image < ActiveRecord::Base

	belongs_to :item

	has_attached_file :image, styles: { thumb: ["100x100#", :png] }, url: :image_url

	validates_attachment :image, 	:presence => true,
									content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"] },
									:size => { :in => 0..5.megabytes }

	validates :image_file_name, uniqueness: true

	private

		def image_url
			return "/images/:style/#{self.image_file_name}"
		end
end