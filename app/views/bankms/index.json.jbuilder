json.array!(@bankms) do |bankm|
  json.extract! bankm, 
  json.url bankm_url(bankm, format: :json)
end