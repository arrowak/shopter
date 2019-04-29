json.extract! product, :id, :category_id, :name, :description, :price, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
