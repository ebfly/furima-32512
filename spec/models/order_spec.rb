require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @userorder = FactoryBot.build(:userorder)
  end
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_order).to be_valid
  end
  
  it 'post_codeが空だと保存できないこと' do
    @user_order.postal_code = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @user_order.postal_code = '1234567'
    @user_donation.valid?
    expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it 'prefectureを選択していないと保存できないこと' do
    @user_order.prefecture = 0
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'cityは空でも保存できること' do
    @user_order.city = nil
    expect(@user_order).to be_valid
  end
  it 'house_numberは空でも保存できること' do
    @user_order.house_number = nil
    expect(@user_order).to be_valid
  end
  it 'building_nameは空でも保存できること' do
    @user_order.building_name = nil
    expect(@user_order).to be_valid
  end
  
  it "tokenが空では登録できないこと" do
    @user_order.token = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Token can't be blank")
  end
end