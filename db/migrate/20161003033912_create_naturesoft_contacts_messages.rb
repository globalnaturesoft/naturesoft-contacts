class CreateNaturesoftContactsMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_contacts_messages do |t|
      t.string :subject
      t.text :message
      t.integer :contact_to_id
      t.references :contact, references: :naturesoft_contacts_contacts, index: true
      
      t.timestamps
    end
  end
end
