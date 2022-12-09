class AddNameToChatMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :name, :string
  end
end
