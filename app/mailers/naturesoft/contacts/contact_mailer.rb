module Naturesoft::Contacts
  class ContactMailer < Naturesoft::ApplicationMailer
    def sending_email_contact(msg)
      @msg = msg
      send_email(@msg.to_contact.email, "[Notifications] You have received a message from #{@msg.contact.email}")
    end
  end
end
