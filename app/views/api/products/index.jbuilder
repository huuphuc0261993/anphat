# json.array! @products do |product|
#   json.id product.id
#   json.name product.name
#   json.price product.price
#   json.description product.description
#   json.discount product.discount
#   json.price_sale product.price_sale
#   json.category product.category

#   json.pictures_attributes product.pictures do |picture|
#     json.id picture.id
#     json.product_id picture.product_id
#     json.url picture.image&.url
#   end
#   json.pictures_id product.pictures.pluck(:id)
# end
