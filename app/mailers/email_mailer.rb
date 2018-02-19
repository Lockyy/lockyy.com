class EmailMailer < ApplicationMailer
  def failure(email)
    @email = email
    mail(to:      'daniel@locky.com',
         subject: 'lockyy.com unsubscription failure')
  end
end
