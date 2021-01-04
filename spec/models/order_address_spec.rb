require 'rails_helper'

RSpec.describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe "商品購入" do
    context "購入がうまくいくとき" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        expect(@order_address).to be_valid
        @order_address.building_name = ""
      end
    end

    context "購入ができないとき" do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Include half-width numbers")
      end

      it 'phone_numberにハイフンが入力されていると保存できないこと' do
        @order_address.phone_number = "-"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include half-width numbers")
      end

      it 'phone_numberに英数混合では保存できないこと' do
        @order_address.phone_number = "090aaaa1111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include half-width numbers")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_address.phone_number = "123456789111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include half-width numbers")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end