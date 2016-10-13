module Naturesoft::Contacts
  class Message < ApplicationRecord
    belongs_to :contact, class_name: "Naturesoft::Contacts::Contact"
    belongs_to :to_contact, class_name: "Naturesoft::Contacts::Contact", foreign_key: :to_contact_id
    
    def display_message
      html = message.gsub("\r\n", "<br/>")
      return html.html_safe
    end
  end
end
