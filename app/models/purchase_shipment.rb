class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, numericality: true
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存して、変数purchaseに代入
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 配送情報を保存する
    # purchase_idには、変数purchaseのidと指定する
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchace_id: purchase.id)
  end
end