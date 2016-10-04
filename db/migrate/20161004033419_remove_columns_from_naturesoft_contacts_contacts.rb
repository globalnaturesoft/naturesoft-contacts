class RemoveColumnsFromNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :naturesoft_contacts_contacts, :subject, :string
    remove_column :naturesoft_contacts_contacts, :message, :text
  end
end
