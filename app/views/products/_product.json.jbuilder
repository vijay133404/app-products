json.extract! product, :id, :product_title, :category, :is_active, :price, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
