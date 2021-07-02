json.id hospital.id

json.body do
  json.name hospital.name
  json.start hospital.start_date
  json.username hospital.username
  json.country hospital.country
  json.region hospital.region
  json.address hospital.address
end

json.dates do
  json.created_at hospital.created_at
  json.updated_at hospital.updated_at
end
