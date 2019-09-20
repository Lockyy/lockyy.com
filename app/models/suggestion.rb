# frozen_string_literal: true

# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  suggestion :string
#  done       :boolean          default(FALSE)
#  good       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

class Suggestion < ApplicationRecord
  validates :suggestion, presence: true
  validates :email, presence: true, email: true
  validates :path, presence: true

  after_create :send_email

  private

  def send_email
    SuggestionMailer.suggestion(email, self).deliver_now
  end
end
