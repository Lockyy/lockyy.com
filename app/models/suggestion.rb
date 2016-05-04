class Suggestion < ActiveRecord::Base
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