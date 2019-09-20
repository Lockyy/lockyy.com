# frozen_string_literal: true

# == Schema Information
#
# Table name: bios
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Bio < ApplicationRecord
  before_destroy :ensure_one

  private

  def ensure_one
    return if Bio.where.not(id: id).any?

    errors.add(:bio, 'cannot delete when only bio')
    false
  end
end
