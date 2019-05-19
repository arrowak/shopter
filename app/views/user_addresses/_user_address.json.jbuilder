json.extract! user_address, :id, :name, :door_apartment, :locality, :city, :state, :country, :pincode, :contact, :alias, :is_home, :user_id, :created_at, :updated_at
json.url user_address_url(user_address, format: :json)
