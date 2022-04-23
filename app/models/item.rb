class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
end
