module Naturesoft
  module Contacts
    class ContactsController < Naturesoft::FrontendController
      def contact
<<<<<<< HEAD
        @body_class = "category-page"
=======
        #contact info
        @contact_info = Naturesoft::Contacts::Contact.find(params[:id])
        
>>>>>>> dd5c5719765d06680824658cc69d6cddc1b8f99f
        #contact form send message
        if params[:contact].present?
            @contact = Naturesoft::Contacts::Contact.new(contact_params)
            respond_to do |format|
                @contact.save
                format.html { redirect_to controller: "contacts", action: "success" }
            end
        end
      end
      
      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def contact_params
          params.require(:contact).permit(:first_name, :last_name, :email, :phone, :subject, :message)
      end
    end
  end
end
