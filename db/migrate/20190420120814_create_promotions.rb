class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :promotable, polymorphic: true
      t.boolean :active
      t.integer :priority

      t.timestamps
    end
  end
end
