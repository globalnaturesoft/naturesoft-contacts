module Naturesoft
  module Contacts
    class ContactsController < Naturesoft::FrontendController
      before_action :set_contact, only: [:contact, :send_message]
      
      def contact
        @body_class = "category-page"
      end
      
      def send_message
        #contact form send message
        if params[:contact].present?
          @contact = Naturesoft::Contacts::Contact.new(contact_params)
          if @contact.save and params[:msg].present?
            @msg = Naturesoft::Contacts::Message.new(message_params)
            @msg.contact_id = @contact.id
            @msg.contact_to_id = @contact_info.id
            respond_to do |format|
              if @msg.save
                format.html { redirect_to contacts_path, notice: 'Contact was successfully sended' }
              end
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
            params.require(:contact).permit(:first_name, :last_name, :email, :phone)
        end
        def message_params
          params.require(:msg).permit(:subject, :message)
        end
    end
  end
end
