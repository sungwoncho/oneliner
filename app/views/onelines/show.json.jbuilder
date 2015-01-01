# json.extract! @oneline, :id, :subject, :definition, :created_at, :updated_at
json.partial! 'oneline', oneline: @oneline
json.author do
  json.id @oneline.author_id
  json.is_author @oneline.is_author?(current_user)
end
