class OrderAddress
  include ActiveModel::Model
  #user,item.addressのカラム名を記述
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :house_number
    validates :token
    validates :user_id
    validates :item_id
    validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'is invalid. Include half-width numbers' } 
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    #注文情報を保存
    order_address = Order.create(user_id: user_id, item_id: item_id)
    #住所の情報を保存
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_address.id)
  end
end
