json.extract! review, :id, :user_id, :title, :review, :created_at, :updated_at
json.url review_url(review, format: :json)
