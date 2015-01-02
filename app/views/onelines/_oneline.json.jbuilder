json.(oneline, :id, :subject, :definition)

json.authored_date oneline.authored_date
json.upvote_count oneline.upvote_count
json.downvote_count oneline.downvote_count

if user_signed_in?
  json.upvoted current_user.upvoted?(oneline)
  json.downvoted current_user.downvoted?(oneline)
end

json.author do
  json.id oneline.author_id
  json.username oneline.author.username
  json.is_author oneline.is_author?(current_user)
end
