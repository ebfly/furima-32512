class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :condition
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_fee_burden
  has_one_attached :image
  has_one :order
  
  
  #空の出品を保存できない
  with_options presence: true do
   validates :name, length: { maximum: 40 }
   validates :text, length: { maximum: 1000 }
   validates :user, :image
   VALID_PRICEL_HALF =  /\A[0-9]+\z/
   validates :price, numericality: {greater_than: 299, less_than: 10000000, message: "Out of setting range"},
              format: {with: VALID_PRICEL_HALF, message: "Half-width number"}
  end

  #各項目の選択が「---」の時は保存できない
  validates :category_id, :condition_id, :prefecture_id, :shipping_date_id, :shipping_fee_burden_id,  numericality: { other_than: 1 }
end
