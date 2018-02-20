class EmailController < ApplicationController
  def create
    @suggestion = Suggestion.create(suggestion_params)
    @mailchimp_add_successful = MailchimpList.add(email_address)
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

  def email_address
    @email_address ||= suggestion_params[:email]
  end

  def failed_flash_message(email)
    {
      danger: "#{email} could not be unsubscribed. " \
              'Please try again in a few minutes. ' \
              'If you are still having trouble contact ' \
              'daniel@lockyy.com to get this resolved.',
    }
  end

  def suggestion_params
    params.require(:submission).permit(:email, :suggestion, :path).tap do |params|
      params[:email].strip!
      params[:email].downcase!
    end
  end

  def successful_flash_message(email)
    { success: "#{email} unsubscribed" }
  end
end
