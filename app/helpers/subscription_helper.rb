module SubscriptionHelper
  def failed_subscribe_message(email_address, suggestion_string)
    "Could not subscribe #{email_address}.".tap do |message|
      message << ' Suggestion saved!' if suggestion_string.present?
    end
  end

  def successful_subscribe_message(email_address, suggestion_string)
    "Subscribed #{email_address}.".tap do |message|
      message << ' Thanks for your suggestion!' if suggestion_string.present?
    end
  end
end
