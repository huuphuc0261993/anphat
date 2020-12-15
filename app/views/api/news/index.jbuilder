json.array! @news do |new|
  json.title new.title
  json.id new.id
  json.content new.content
  json.image new.image
  json.description new.description
end
