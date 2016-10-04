module Naturesoft::Contacts
  class Message < ApplicationRecord
    belongs_to :contact
  end
end
