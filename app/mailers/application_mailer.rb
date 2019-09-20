# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'suggestions@lockyy.com'
  layout 'mailer'
end
