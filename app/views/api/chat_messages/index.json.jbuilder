json.array! @messages do |chat_message|

json.id chat_message.id



json.message chat_message.message



json.updated_at chat_message.updated_at

end
