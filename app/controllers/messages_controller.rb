class MessagesController < ApplicationController
   
   def index
       @messages = Message.all
   end
   
   def new
       @message = Message.new
   end
   
   def create
      @message = Message.new(message_params)
      if @message.save
         flash[:success] = "Mensagem criada com sucesso"
         redirect_to messages_path
      else
          render 'new'
      end
      
   end
   
   def edit
       @message = Message.find(params[:id])
   end
   
   def update
      @message = Message.find(params[:id])
      if @message.update(message_params)
         flash[:success] = "Mensagem editada com sucesso"
         redirect_to messages_path
         
      else
        render 'new' 
      end
   end
   
   private
   def message_params
      params.require(:message).permit(:title, :content) 
   end
    
end