require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:orderaddress)
  end
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_address).to be_valid
  end
  
  it 'post_codeが空だと保存できないこと' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@user_order.errors.full_messages).to include("Post code can't be blank")
  end
  it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @order_address.postal_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
  end
  it 'prefectureを選択していないと保存できないこと' do
    @order_address.prefecture = 0
    @order_address.valid?
    expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'cityは空でも保存できること' do
    @order_address.city = nil
    expect(@order_address).to be_valid
  end
  it 'house_numberは空でも保存できること' do
    @order_address.house_number = nil
    expect(@order_address).to be_valid
  end
  it 'building_nameは空でも保存できること' do
    @order_address.building_name = nil
    expect(@order_address).to be_valid
  end
  
  it "tokenが空では登録できないこと" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
end