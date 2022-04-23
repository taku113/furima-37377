class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :postage_id
      t.integer :prefecture_id
      t.integer :delivery_time_id
      t.references :user_id
      t.integer :price
      t.timestamps
    end
  end
end
