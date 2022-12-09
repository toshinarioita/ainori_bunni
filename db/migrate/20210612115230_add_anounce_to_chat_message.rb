class AddAnounceToChatMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :anounce, :boolean, :null => false, :default => false
    
  end
end
