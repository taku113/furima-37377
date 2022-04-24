class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
end
