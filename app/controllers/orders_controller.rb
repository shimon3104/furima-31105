class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_receive = OrderReceive.new
  end

  def create
    @order_receive = OrderReceive.new(receive_params)
    @item = Item.find(params[:item_id])
    if @order_receive.valid?
      pay_item
      @order_receive.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def receive_params
    params.require(:order_receive).permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: receive_params[:token],
        currency: 'jpy'
      )
  end

end
