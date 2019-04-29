class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.float :price
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
