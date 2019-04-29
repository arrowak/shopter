class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :active
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
