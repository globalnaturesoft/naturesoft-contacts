module Naturesoft
  module Contacts
    module Backend
      class ContactsController < Naturesoft::Backend::BackendController
        before_action :set_contact, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Contact", naturesoft_contacts.backend_contacts_path
          add_breadcrumb "Contacts", naturesoft_contacts.backend_contacts_path
        end
    
        # GET /contacts
        def index
          @contacts = Contact.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /contacts/1
        def show
          add_breadcrumb @contact.email, naturesoft_contacts.new_backend_contact_path
          add_breadcrumb "Show"
        end
    
        # GET /contacts/new
        def new
          @contact = Contact.new
          add_breadcrumb "New Contact", nil,  class: "active"
        end
    
        # GET /contacts/1/edit
        def edit
          add_breadcrumb "Edit Contact", nil,  class: "active"
        end
    
        # POST /contacts
        def create
          @contact = Contact.new(contact_params)
    
          if @contact.save
            redirect_to backend_contacts_path, notice: 'Contact was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /contacts/1
        def update
          if @contact.update(contact_params)
            redirect_to backend_contacts_path, notice: 'Contact was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /contacts/1
        def destroy
          @contact.destroy
          render text: "Contact was successfully destroyed."
        end
        
        # DELETE /banners/delete?ids=1,2,3
        def delete
          @contacts = Contact.where(id: params[:ids].split(","))
          @contacts.destroy_all
          render text: 'Contact(s) was successfully destroyed.'
        end
        
        # GET /contacts/select2
        def select2
          render json: Contact.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_contact
            @contact = Contact.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def contact_params
            params.fetch(:contact, {}).permit(:first_name, :last_name, :email, :phone, :address, :description,
                                              :company, :certificate_of_business_registration_no, :date_of_issue, :place_of_issue,
                                              :phone_2, :email_2, :hotline_1, :hotline_2, :fax, :head_office, :branch_office, :agent, :working_time)
          end
      end
    end
  end
end
