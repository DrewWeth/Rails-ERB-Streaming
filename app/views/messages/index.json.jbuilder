json.array!(@messages) do |message|
  json.extract! message, :id, :message, :color
  json.url message_url(message, format: :json)
end
