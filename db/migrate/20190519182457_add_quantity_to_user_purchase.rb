class AddQuantityToUserPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :user_purchases, :quantity, :integer
  end
end
