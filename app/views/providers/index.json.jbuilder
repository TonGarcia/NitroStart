json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :provides, :pitch_id, :start_up_id
  json.url provider_url(provider, format: :json)
end
