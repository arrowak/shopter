class Order < ApplicationRecord
  serialize :user_purchases, JSON
end
