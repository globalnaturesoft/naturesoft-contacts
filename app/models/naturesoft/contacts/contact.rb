module Naturesoft::Contacts
  class Contact < ApplicationRecord
  validates :first_name, :email, :phone, :address, :subject, :message, presence: true
    
    def self.sort_by
      [
        ["Name","naturesoft_contacts_contacts.name"],
        ["Created At","naturesoft_contacts_contacts.created_at"]
      ]
    end
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      if params[:contact_id].present?
        records = records.where(contact_id: params[:contact_id])
      end
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_contacts_contacts.first_name,' ',naturesoft_contacts_contacts.last_name,' ',naturesoft_contacts_contacts.email,' ',naturesoft_contacts_contacts.phone,' ',naturesoft_contacts_contacts.message)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : ",' ',naturesoft_contacts_contacts.last_name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    def display_name
      if first_name.present? and last_name.present?
        name = first_name + last_name
      elsif first_name.present? and !last_name.present?
        name = first_name
      elsif !first_name.present? and last_name.present?
        name = last_name
      end
      return name
    end
  end
end
