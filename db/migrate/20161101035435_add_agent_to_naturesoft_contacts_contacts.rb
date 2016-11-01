class AddAgentToNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_contacts_contacts, :agent, :string
  end
end
