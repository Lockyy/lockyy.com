# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  email_id   :integer
#  suggestion :string
#  done       :boolean          default(FALSE)
#  good       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Suggestion < ApplicationRecord
  belongs_to :email
  validates :suggestion, presence: true

  after_create :send_to_email

  def suggester_email
    email.email
  end

  private

  def send_to_email
    SuggestionMailer.suggestion(email, self).deliver_now
  end
end
