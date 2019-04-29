class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.binary :image

      t.timestamps
    end
  end
end
