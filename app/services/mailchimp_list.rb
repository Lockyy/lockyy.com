# frozen_string_literal: true

class MailchimpList < Object
  class << self
    def contains_email_address?(email_address)
      email_addresses.include?(email_address)
    end

    def add(email_address)
      return true if contains_email_address?(email_address)

      mailchimp_api_object.lists.subscribe(list_id, mailchimp_hash(email_address))
      true
    rescue Mailchimp::ListInvalidUnsubMemberError => _e
      false
    rescue Mailchimp::Error => _e
      false
    end

    def remove(email_address)
      return true unless contains_email_address?(email_address)

      mailchimp_api_object.lists.unsubscribe(list_id, mailchimp_hash(email_address))['complete']
    end

    def email_addresses
      members = mailchimp_api_object.lists.members(list_id)['data']
      members.map { |email| email['email'] }
    end

    private

    def mailchimp_hash(email_address)
      { 'email' => email_address }
    end

    def mailchimp_api_object
      Mailchimp::API.new(mailchimp_api_key)
    end

    def list_id
      ENV['MAILCHIMPLISTID']
    end

    def mailchimp_api_key
      ENV['MAILCHIMPAPIKEY']
    end
  end
end
