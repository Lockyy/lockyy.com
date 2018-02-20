class EmailController < ApplicationController
  def create
    @email_address = params[:email].strip.downcase
    create_suggestion
    return render(:could_not_create) unless MailchimpList.add(@email_address)
  end

  def destroy
    email_address = params[:email].strip.downcase

    flash_message = if MailchimpList.remove(email_address)
                      failed_flash_message(email_address)
                    else
                      successful_flash_message(email_address)
                    end

    redirect_to new_unsubscribe_path, flash: flash_message
  end

  private

  def create_suggestion
    return if suggestion_string.blank?
    Suggestion.create(suggestion: suggestion_string, email: @email_address)
  end

  def suggestion_string
    params[:suggestion]
  end
  helper_method :suggestion_string

  def failed_flash_message(email)
    {
      danger: "#{email} could not be unsubscribed. " \
              'Please try again in a few minutes. ' \
              'If you are still having trouble contact ' \
              'daniel@lockyy.com to get this resolved.',
    }
  end

  def successful_flash_message(email)
    { success: "#{email} unsubscribed" }
  end
end
