class OrdersController < ApplicationController

  before_action :set_conditions, only: [:edit, :update, :create, :destroy]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    # @order = Order.new(order_params)
    #  if @order.valid?
    #    @order.save
    #    return redirect_to root_path
    #  else
    #    render :index
    #  end
  end

  private

  def order_params
    params.require(:order).permit(:price)
  end

  def set_conditions
    redirect_to  root_path if @item.user == current_user 
  end
end
