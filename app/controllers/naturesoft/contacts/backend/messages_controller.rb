module Naturesoft
  module Contacts
    module Backend
      class MessagesController < Naturesoft::Backend::BackendController
        before_action :set_message, only: [:show, :edit, :update, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Contact", naturesoft_contacts.backend_contacts_path
          add_breadcrumb "Messages", naturesoft_contacts.backend_messages_path
        end
    
        # GET /messages
        def index
          @messages = Message.all.paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /messages/1
        def show
          add_breadcrumb "Show Message", nil,  class: "active"
        end
    
        # GET /messages/new
        def new
          @message = Message.new
        end
    
        # GET /messages/1/edit
        def edit
        end
    
        # POST /messages
        #def create
        #  @message = Message.new(message_params)
        #
        #  if @message.save
        #    redirect_to @message, notice: 'Message was successfully created.'
        #  else
        #    render :new
        #  end
        #end
    
        # PATCH/PUT /messages/1
        #def update
        #  if @message.update(message_params)
        #    redirect_to @message, notice: 'Message was successfully updated.'
        #  else
        #    render :edit
        #  end
        #end
    
        # DELETE /messages/1
        def destroy
          @message.destroy
          render text: 'Message was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_message
            @message = Message.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def message_params
            params.fetch(:message, {}).permit(:subject, :message)
          end
      end
    end
  end
end
