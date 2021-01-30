json.array! @news do |new|
  json.title new.title
  json.id new.id
  json.content new.content
  json.image new.image
  json.description new.description
  json.created_at new.created_at
  json.type_post new.type_post
end
