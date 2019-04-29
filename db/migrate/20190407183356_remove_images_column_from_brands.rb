class RemoveImagesColumnFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :image
  end
end
