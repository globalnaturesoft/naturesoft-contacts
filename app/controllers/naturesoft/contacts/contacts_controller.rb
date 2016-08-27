module Naturesoft
  module Contacts
    class ContactsController < Naturesoft::FrontendController
      def contact
        
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
