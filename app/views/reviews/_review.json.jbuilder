json.extract! review, :id, :title, :description, :score, :unit_id, :reviewer_id, :created_at, :updated_at
json.url review_url(review, format: :json)
