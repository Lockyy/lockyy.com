class EmailController < ApplicationController
  def create
    @email = Email.find_or_create_by(email: params[:email].strip.downcase)

    if params[:suggestion] && @email.persisted?
      @suggestion = @email.suggestions.create(suggestion: params[:suggestion])
    end
  end

  def destroy
    email_address = params[:email].strip.downcase

    Email.where(email: email_address).each(&:destroy)

    flash_message = if check_email_deleted(email_address)
                      failed_flash_message(email_address)
                    else
                      successful_flash_message(email_address)
                    end

    redirect_to new_unsubscribe_path, flash: flash_message
  end

  private

  def check_email_deleted(email)
    email = Email.find_by(email: email)
    EmailMailer.failure(email).deliver_now if email.present?
    email.present?
  end

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
