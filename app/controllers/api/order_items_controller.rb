class Api::OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
    render json: @order_items
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      OrderMailer.with(order_item: @order_item).new_order_email.deliver_later
      render json: @order_item
    else
      render json: { json: @order_item.errors, status: :unprocessable_entity }
    end
  end

  def show
    @order_item = OrderItem.find(params[:id])
    render json: { data: @order_item, status: :ok, message: 'Success' }
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { json: @order_item.error, status: :unprocessable_entity }
    end
  end
  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      render json: { json: 'Order_Items was successfully deleted.' }
    else
      render json: { json: @order_item.errors, status: :unprocessable_entity }
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:id, :price, :quantity, :order_id, :product_id)
  end
end
