class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_title
      t.string :category
      t.boolean :is_active
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
