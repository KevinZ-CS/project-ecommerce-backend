class Api::CartsController < ApplicationController
skip_before_action :authorize_admin_user, only: [:create, :delete]
skip_before_action :authorize_user, only: [:create, :delete]

def create
    item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    size = params[:size]
    user_id = params[:user_id]
    current_order = @cart.orders.find_by(item_id: item.id, size: size)

    if current_order && quantity > 0 
        current_order.update(quantity: quantity)
        render json: current_order, status: :ok

    elsif quantity <= 0
        current_order.destroy
        head :no_content
    else
        addedItem = @cart.orders.create(item: item, quantity: quantity, size: size, user_id: user_id)
        render json: addedItem, status: :created
    end
end

def delete
    @cart.orders.find_by(id: params[:id]).destroy
    head :no_content
end
  
end
