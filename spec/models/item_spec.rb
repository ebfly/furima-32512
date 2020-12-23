require 'rails_helper'

describe Item, type: :model do
  before do
    @user = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '出品がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end