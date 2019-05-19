class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :name
      t.string :door_apartment
      t.string :locality
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.string :contact
      t.string :alias
      t.boolean :is_home
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
