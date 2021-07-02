
json.id unit.id

json.body do
  json.name unit.name
  json.unitHead unit.unithead
  json.unit_username unit.unitname
  json.Admin unit.administrator_id
  json.score unit.avg_score
end

json.dates do
  json.created_at unit.created_at
  json.updated_at unit.updated_at
end
