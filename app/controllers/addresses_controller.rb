class AddressesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item 

    def index
      @order_address = OrderAddress.new
      if current_user == @item.user || @item.order
        redirect_to root_path
      end
    end
  
    def create
      @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
      else
        render action: :index
      end
    end

    private

      def set_item
        @item = Item.find(params[:item_id])
      end

      def order_params
        params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :buliding_name, :phone_number)
        .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
      end

      def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  #テスト秘密鍵を環境変数に設定
        Payjp::Charge.create(
          amount: @item.price,  # 商品の値段
          card: order_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
      end
end
