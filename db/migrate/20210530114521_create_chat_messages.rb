class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.timestamps
    end
  end
end


