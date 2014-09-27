json.array!(@areams) do |aream|
  json.extract! aream, 
  json.url aream_url(aream, format: :json)
end