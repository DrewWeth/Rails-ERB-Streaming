json.array!(@request_logs) do |request_log|
  json.extract! request_log, :id, :url
  json.url request_log_url(request_log, format: :json)
end
