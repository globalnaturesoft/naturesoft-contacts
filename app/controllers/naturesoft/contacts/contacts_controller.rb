module Naturesoft
  module Contacts
    class ContactsController < Naturesoft::FrontendController
      before_action :set_contact, only: [:send_message]
      
      def contact
        @body_class = "category-page"
      end
      
      def send_message
        #contact form send message
        if params[:contact].present?
          @contact = Naturesoft::Contacts::Contact.new(contact_params)
          respond_to do |format|
            if @contact.save
              Naturesoft::UserMailer.sending_email_contact(@contact, @contact_info).deliver_now
              format.html { redirect_to contacts_path, notice: 'Contact was successfully sended' }
            end
          end
        end
      end
      
      private
        def set_contact
          @contact_info = Naturesoft::Contacts::Contact.find(params[:id])
        end
        # Never trust parameters from the scary internet, only allow the white list through.
        def contact_params
            params.require(:contact).permit(:first_name, :last_name, :email, :phone, :subject, :message)
        end
    end
  end
end
