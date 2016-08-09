class CreateNaturesoftContacts < ActiveRecord::Migration[5.0]
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
      t.references :user, references: :naturesoft_users, index: true

      t.timestamps
    end
  end
end
