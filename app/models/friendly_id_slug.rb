# frozen_string_literal: true

# == Schema Information
#
# Table name: friendly_id_slugs
#
#  id             :integer          not null, primary key
#  slug           :string           not null
#  sluggable_id   :integer          not null
#  sluggable_type :string(50)
#  scope          :string
#  created_at     :datetime
#

class FriendlyIdSlug < ApplicationRecord
  belongs_to :sluggable
end
