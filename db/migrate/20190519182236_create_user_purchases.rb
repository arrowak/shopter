class CreateUserPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :user_purchases do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.float :price
      t.integer :payment_mode

      t.timestamps
    end
  end
end
