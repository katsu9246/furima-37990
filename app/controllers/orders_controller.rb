class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_conditions, only: [:index, :create]

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
        @purchase_add.save
        redirect_to items_path
      else
        render :index
      end
  end

  private

  def add_params
    params.require(:purchase_add).permit(:post_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_conditions
    redirect_to items_path if @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
