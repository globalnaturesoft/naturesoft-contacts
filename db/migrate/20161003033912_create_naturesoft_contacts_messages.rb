class CreateNaturesoftContactsMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_contacts_messages do |t|
      t.string :subject
      t.text :message
      t.references :contact, references: :naturesoft_contacts_contacts, index: true
      t.references :to_contact, references: :naturesoft_contacts_contacts, index: true, column: :to_contact_id
      
      t.timestamps
    end
  end
end
