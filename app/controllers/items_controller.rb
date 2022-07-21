class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_conditions, only: [:edit, :update, :destroy]
  before_action :purchase_conditions, only: [:create, :edit]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :explanation, :situation_id, :delivery_charge_id, :shipment_source_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_conditions
    redirect_to  items_path if @item.user != current_user 
  end
  
  def purchase_conditions
    redirect_to items_path if @item.user_id == current_user.id || @item.purchase != nil
  end
end