class AddWorkingTimeToNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_contacts_contacts, :working_time, :text
  end
end
