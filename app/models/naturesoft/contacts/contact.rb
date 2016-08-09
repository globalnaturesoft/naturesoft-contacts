module Naturesoft::Contacts
  class Contact < ApplicationRecord
    belongs_to :user
  end
end
