class Api::ChatMessagesController < ApplicationController
    def index

        @group = Recruitment.find(params[:recruitment_id])
        
        @messages = @group.chat_messages.includes(:user).where('id > ?', params[:id])
        
        respond_to do |format|
        
          format.html
        
          format.json
        
          end
        
    end
    def create

        @conversations = ChatMessage.new(messages_params)
        
        if @conversations.save
        
        respond_to do |format|
        
          format.html
        
          format.json
        
          end
        
        end
        
        end
end
