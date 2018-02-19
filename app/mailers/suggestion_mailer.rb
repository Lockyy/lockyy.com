class SuggestionMailer < ApplicationMailer
  def suggestion(email_address, suggestion)
    @email_address = email_address
    @suggestion = suggestion
    mail(to:       ENV['SUGGESTION_BOX_EMAIL'],
         subject:  'Suggestion from website',
         reply_to: @email_address)
  end
end
