json.extract! category, :id, :name, :active, :description, :notes, :created_at, :updated_at
json.url category_url(category, format: :json)
