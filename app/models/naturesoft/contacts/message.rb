module Naturesoft::Contacts
  class Message < ApplicationRecord
    belongs_to :contact, class_name: "Naturesoft::Contacts::Contact"
    belongs_to :to_contact, class_name: "Naturesoft::Contacts::Contact", foreign_key: :to_contact_id
  end
end
