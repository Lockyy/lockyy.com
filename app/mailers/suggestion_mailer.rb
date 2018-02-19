class SuggestionMailer < ApplicationMailer
  def suggestion(email, suggestion)
    @email = email
    @suggestion = suggestion
    mail(to:         ENV['SUGGESTION_BOX_EMAIL'],
         subject:    'Suggestion from website',
         respond_to: 'suggestions@lockyy.com')
  end
end
