module Naturesoft::Contacts
  class ContactMailer < Naturesoft::ApplicationMailer
    default from: 'soft.support@hoangkhang.com.vn'
    
    def sending_email_contact(msg)
      @msg = msg
      mail(to: @msg.to_contact.email, subject: "[Notifications] You have received a message from #{@msg.contact.email}")
    end
  end
end
