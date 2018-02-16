# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ApplicationRecord
  has_many :suggestions

  validates :email, presence: true, format: { with: /.+\@.+\..+/, message: 'must be an email' }

  after_create :send_to_mailchimp

  private

  def send_to_mailchimp
    mailchimp = Mailchimp::API.new(ENV['MAILCHIMPAPIKEY'])
    return if mailchimp.lists.members(ENV['MAILCHIMPLISTID'])['data'].map { |email| email['email'] }.include?(email)
    mailchimp.lists.subscribe(ENV['MAILCHIMPLISTID'],
                              'email' => email,
                              'euid'  => id,
                              'leid'  => id)
  end
end
