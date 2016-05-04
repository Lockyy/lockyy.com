class Email < ActiveRecord::Base
  has_many :suggestions

  validates :email, presence: true, format: { with: /.+\@.+\..+/, message: 'must be an email' }

  after_create :send_to_mailchimp

  private

  def send_to_mailchimp
    mailchimp = Mailchimp::API.new(ENV['MAILCHIMPAPIKEY'])
    return if mailchimp.lists.members(ENV['MAILCHIMPLISTID'])['data'].map { |email| email['email'] }.include?(email)
    mailchimp.lists.subscribe(ENV['MAILCHIMPLISTID'], {
      "email" => email,
      "euid"  => id,
      "leid"  => id,
    })
  end
end
