class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :not_current_user, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :prefecture_id).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def not_current_user
      if user_signed_in? && current_user.id != @item.user_id
        redirect_to root_path
      end
    end
end
