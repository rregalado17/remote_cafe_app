json.extract! user, :id, :email, :username, :job_role, :created_at, :updated_at
json.url user_url(user, format: :json)
