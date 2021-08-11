json.id @reviewer.id
json.body do
  json.name @reviewer.name
  json.email @reviewer.email
  json.username @reviewer.username
  json.address @reviewer.address
  json.sex @reviewer.sex
  json.phone @reviewer.phone
end
json.reviewer_slots @reviewer.units
json.dates do
  json.created_at @reviewer.created_at
  json.updated_at @reviewer.updated_at
end
