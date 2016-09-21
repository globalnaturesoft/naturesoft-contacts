class AddCompanyToNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_contacts_contacts, :company, :string
  end
end
