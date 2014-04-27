class Bio < ActiveRecord::Base
  
	def self.cached_bio_lines
		Rails.cache.fetch([name, "bio-lines"], expires_in: 5.minutes) do
			Bio.all.order(:order).to_a
		end
	end
	
end