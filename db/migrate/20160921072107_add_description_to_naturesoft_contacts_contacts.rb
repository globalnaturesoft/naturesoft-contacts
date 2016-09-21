class AddDescriptionToNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_contacts_contacts, :description, :text
  end
end
