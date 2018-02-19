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

  validates :email, presence: true, email: true, uniqueness: true

  after_create :send_to_mailchimp
  before_destroy :remove_from_mailchimp

  private

  def send_to_mailchimp
    return if in_list?
    mailchimp.lists.subscribe(ENV['MAILCHIMPLISTID'], mailchimp_hash)
  end

  def remove_from_mailchimp
    return unless in_list?
    mailchimp.lists.unsubscribe(ENV['MAILCHIMPLISTID'], mailchimp_hash.merge(delete_member: true))
  end

  def mailchimp_hash
    {
      'email' => email,
      'euid'  => id,
      'leid'  => id,
    }
  end

  def in_list?
    mailchimp = Mailchimp::API.new(ENV['MAILCHIMPAPIKEY'])
    members = mailchimp.lists.members(ENV['MAILCHIMPLISTID'])['data']
    emails = members.map { |email| email['email'] }
    emails.include?(email)
  end
end
