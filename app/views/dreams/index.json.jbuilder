json.array!(@dreams) do |dream|
  json.extract! dream, :id, :content, :timeline, :completed
  json.url dream_url(dream, format: :json)
end
