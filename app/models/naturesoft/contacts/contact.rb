module Naturesoft::Contacts
  class Contact < ApplicationRecord
  validates :email, :phone, presence: true
  has_many :sent_messages, class_name: "Naturesoft::Contacts::Message", dependent: :destroy
  has_many :received_messages, class_name: "Naturesoft::Contacts::Message", foreign_key: :to_contact_id, dependent: :destroy
    
    def self.sort_by
      [
        ["Created At","naturesoft_contacts_contacts.created_at"],
        ["Name","naturesoft_contacts_contacts.name"],
      ]
    end
    def self.sort_orders
      [
        ["DESC","desc"],
        ["ASC","asc"],
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
          records = records.where("LOWER(CONCAT(naturesoft_contacts_contacts.first_name,' ',naturesoft_contacts_contacts.last_name,' ',naturesoft_contacts_contacts.email
																	,' ',naturesoft_contacts_contacts.phone,' ',naturesoft_contacts_contacts.message,' ',naturesoft_contacts_contacts.company,' ',naturesoft_contacts_contacts.address,' ',naturesoft_contacts_contacts.head_office,' ',naturesoft_contacts_contacts.branch_office)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_contacts_contacts.first_name, naturesoft_contacts_contacts.last_name"
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
    
    def display_contact_name
      str = []
      str << self.company if company.present?
      str << self.first_name + " " + self.last_name if self.first_name.present? or self.last_name.present?
      str << self.email if self.email.present?
      return str.join(" / ")
    end
    
    # data for select2 ajax
    def self.select2(params)
			items = self.search(params).order("email")
			if params[:excluded].present?
				items = items.where.not(id: params[:excluded].split(","))
			end
			options = [{"id" => "", "text" => "none"}]
			options += items.map { |c| {"id" => c.id, "text" => c.display_contact_name} }
			result = {"items" => options}
		end
		
		def get_working_times
			working_time.to_s.split("\r\n").select {|c| c.present? }
		end
    
  end
end
