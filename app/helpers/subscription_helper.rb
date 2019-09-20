# frozen_string_literal: true

module SubscriptionHelper
  def subscribe_message(suggestion, mailchimp_add_successful, email_address)
    [
      suggestion.persisted? ? 'Suggestion saved' : nil,
      mailchimp_add_successful ? "#{email_address} subscribed" : "Could not subscribe #{email_address}",
    ].compact.join(', ')
  end
end
