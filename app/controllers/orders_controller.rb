class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    elsif user_signed_in?
    else
      redirect_to new_user_session_path
    end
    @order = Order.new
  end

  def create
    @order = OrderDestination.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
