class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end
  
  private
    def item_params
      params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :prefecture_id, :user)
    end
end
