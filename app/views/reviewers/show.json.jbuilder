json.id @reviewer.id
json.body do
  json.name @reviewer.name
  json.email @reviewer.email
  json.username @reviewer.username
  json.phone @reviewer.phone
end
json.reviewer_slots @reviewer.slots
json.dates do
  json.created_at @reviewer.created_at
  json.updated_at @reviewer.updated_at
end
