class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_receive = OrderReceive.new
  end

  def create
    @order_receive = OrderReceive.new(receive_params)
    if @order_receive.valid?
      @order_receive.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def receive_params
    params.require(:order_receive).permit(:postal_code, :prefecture_id, :city_name, :address, :phone_number).merge(user_id: current_user.id, item_id: params[item.id])
  end
end
