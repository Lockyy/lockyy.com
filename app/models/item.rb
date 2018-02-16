# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  section_id :integer
#  name       :string
#  content    :text
#  link       :string
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ApplicationRecord
  default_scope { order 'section_id, position' }

  belongs_to :section, touch: true

  validates :section_id, presence: true
end
