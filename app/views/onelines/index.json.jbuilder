json.array!(@onelines) do |oneline|
  json.extract! oneline, :id
  json.url oneline_url(oneline, format: :json)
end
