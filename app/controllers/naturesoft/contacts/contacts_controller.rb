module Naturesoft
  module Contacts
    class ContactsController < Naturesoft::FrontendController
      before_action :set_contact, only: [:contact]
      
      def send_message
        #contact form send message
        if params[:contact].present?
          @contact = Naturesoft::Contacts::Contact.new(contact_params)
          respond_to do |format|
            if @contact.save
              format.html { redirect_to contacts_path, notice: 'Tin nhắn đã được gửi thành công! Chúng tôi sẽ liên hệ lại cho bạn trong thời gian sớm nhất' }
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
