class Recruitment < ApplicationRecord
    
    has_many :users, through: :user_recruitments
    has_many :user_recruitments, dependent: :destroy
    has_many :participated_users, through: :user_recruitments, source: :user
    has_many :chat_messages, dependent: :destroy
    validates :datetime, presence: true
    

end
