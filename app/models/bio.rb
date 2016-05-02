class Bio < ActiveRecord::Base
  before_destroy :ensure_one

  private

  def ensure_one
    unless Bio.all.length > 1
      errors.add(:bio, 'cannot delete when only bio')
      false
    end
  end
end
