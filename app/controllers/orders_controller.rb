class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_conditions, only: [:index]
  before_action :purchase_conditions, only: [:index, :create]
  def index
    if user_signed_in?
      @purchase_add = PurchaseAdd.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @purchase_add = PurchaseAdd.new(add_params)
      if @purchase_add.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  #【学習メモ】 PAY.JPテスト秘密鍵を記述段階を踏んで、環境変数の呼びこむ記述をする
        Payjp::Charge.create(
          amount: @item.price,  #【学習メモ】 商品の値段は、購入しようとするアイテムに紐づいた値段を引っ張ってくる
          card: add_params[:token],    # 【学習メモ】カードトークン 32〜34行目で設定しているものを引っ張ってくる
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
        @purchase_add.save
        redirect_to items_path(@item.user_id)
      else
        render :index
      end
  end

  private

  def add_params
    params.require(:purchase_add).permit(:post_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_conditions
    redirect_to items_path if @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_conditions
    redirect_to items_path if @item.user_id == current_user.id || @item.purchase != nil
    #【学習メモ】「@item.user_id」は、itemsテーブルにあるuser_idを取得。itemモデルとuserモデルでアソシエーションを組んでいるため可能。
    #【学習メモ】「@item.purchase」は、itemsモデルに紐づくpurchasesモデルのitem_idを取得。itemモデルとpurchasesモデルでアソシエーションを組んでいるため可能。
  end
end
