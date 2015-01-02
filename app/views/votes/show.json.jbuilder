json.id @oneline.id
json.upvoted current_user.upvoted?(@oneline)
json.downvoted current_user.downvoted?(@oneline)

json.upvote_count @oneline.upvote_count
json.downvote_count @oneline.downvote_count
