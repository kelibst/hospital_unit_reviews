json.id user.id

json.body do
  json.email user.email
  json.role user.role
end

json.dates do
  json.created_at user.created_at
  json.updated_at user.updated_at
end
