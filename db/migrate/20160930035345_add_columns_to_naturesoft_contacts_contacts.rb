class AddColumnsToNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_contacts_contacts, :certificate_of_business_registration_no, :string
    add_column :naturesoft_contacts_contacts, :place_of_issue, :string
    add_column :naturesoft_contacts_contacts, :date_of_issue, :string
    add_column :naturesoft_contacts_contacts, :phone_2, :string
    add_column :naturesoft_contacts_contacts, :hotline_1, :string
    add_column :naturesoft_contacts_contacts, :hotline_2, :string
    add_column :naturesoft_contacts_contacts, :fax, :string
    add_column :naturesoft_contacts_contacts, :email_2, :string
    add_column :naturesoft_contacts_contacts, :head_office, :string
    add_column :naturesoft_contacts_contacts, :branch_office, :string
  end
end
