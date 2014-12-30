json.array!(@onelines) do |oneline|
  json.extract! oneline, :id, :subject
end
