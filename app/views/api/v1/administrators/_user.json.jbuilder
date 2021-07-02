json.id user.id

json.body do
  json.email user.email
  json.role user.role
  json.phone user.phone
  json.username user.username
end

json.dates do
  json.created_at user.created_at
  json.confirmed user.email_confirmed ?  user.confirmed_at : user.confirmation_token
  json.updated_at user.updated_at
end
