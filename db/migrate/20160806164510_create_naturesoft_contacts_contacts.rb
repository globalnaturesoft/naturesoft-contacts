class CreateNaturesoftContactsContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_contacts_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.text :message
      t.string :subject
      t.string :status, :default => "active"

      t.timestamps
    end
  end
end
