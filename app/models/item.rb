class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :prefecture, :shipping_date, :shipping_fee_burden
  
  #空の出品を保存できない
  with_options presence: true do
    validates :name, :text, :price, :user
  end

  #各項目の選択が「---」の時は保存できない
  validates :category_id, :condition_id, :prefecture_id, :shipping_date_id, :shipping_fee_burden_id,
   numericality: { other_than: 1 }
end
