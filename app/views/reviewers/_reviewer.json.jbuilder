json.extract! reviewer, :id, :name, :address, :email, :phone, :hospital_id, :activecode, :created_at, :updated_at
json.url reviewer_url(reviewer, format: :json)
