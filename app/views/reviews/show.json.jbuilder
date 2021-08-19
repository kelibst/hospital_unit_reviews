json.id @review.id

json.body do
  json.title @review.title
  json.description @review.description
  json.score   review.score
  json.reviewer_id @review.reviewer_id
end

json.dates do
  json.created_at @review.created_at
  json.updated_at @review.updated_at
  json.url review_url(@review, format: :json)
end
