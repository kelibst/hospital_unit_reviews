
json.id unit.id

json.body do
  json.name unit.name
  json.unitHead unit.unithead
  json.Admin unit.administrators_id
end

json.dates do
  json.created_at unit.created_at
  json.updated_at unit.updated_at
end
