class SubscribeController < ApplicationController
  def email
    @email = Email.find_or_create_by(email: params[:email])
    @suggestion = @email.suggestions.create(suggestion: params[:suggestion]) if params[:suggestion] && @email.persisted?
  end
end
