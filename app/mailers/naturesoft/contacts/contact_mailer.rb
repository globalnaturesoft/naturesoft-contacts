module Naturesoft::Contacts
  class ContactMailer < Naturesoft::ApplicationMailer
    def sending_email_contact(msg)
      @msg = msg
      send_email(@msg.to_contact.email, "#{t(:subject_send_email_contact)} #{@msg.contact.email}")
    end
  end
end
