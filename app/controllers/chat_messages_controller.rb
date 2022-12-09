class ChatMessagesController < ApplicationController

    def index
        @group = Recruitment.find(params[:recruitment_id])
        redirect_to action: 'index', controller: 'recruitments' unless @group.participated_users.include?(current_user)
        @messages = Recruitment.find(params[:recruitment_id]).chat_messages
    end
        
        
        
    def create
        @conversations = ChatMessage.new(messages_params)

        @conversations.save

        if @conversations.save
            redirect_to action: 'index', notice: 'メッセージを作成しました。'
        else
            redirect_to action: 'index', notice: 'メッセージの作成に失敗しました。'
        end
        
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :'index'
    end
    
    private
    def messages_params
        params.require(:chat_message).permit(:message, :recruitment_id).merge(user_id: current_user.id)
    end
    
    
end
