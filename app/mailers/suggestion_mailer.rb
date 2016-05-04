class SuggestionMailer < ApplicationMailer
  default from: 'suggestions@lockyy.com'

  def suggestion(email, suggestion)
    @suggestion = suggestion
    mail(from: @suggestion.suggester_email,
         to: ENV['SUGGESTION_BOX_EMAIL'],
         subject: 'Suggestion from website')
  end
end