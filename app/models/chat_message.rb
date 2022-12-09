class ChatMessage < ApplicationRecord
  belongs_to :user

  belongs_to :recruitment
  
end
  
