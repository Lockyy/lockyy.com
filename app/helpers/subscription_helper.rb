# frozen_string_literal: true

module SubscriptionHelper
  def subscribe_message(suggestion, mailchimp_add_successful, email_address)
    ''.tap do |message|
      message << 'Suggestion saved, ' if suggestion.persisted?
      subscribed_message = mailchimp_add_successful ? "#{email_address} subscribed" :
                                                      "Could not subscribe #{email_address}"
      message << subscribed_message
    end
  end
end
