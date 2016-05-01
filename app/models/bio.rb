class Bio < ActiveRecord::Base
  default_scope { order 'position' }

  def self.cached_bio_lines
    Rails.cache.fetch([name, 'bio-lines'], expires_in: 5.minutes) do
      Bio.all.to_a
    end
  end
end
