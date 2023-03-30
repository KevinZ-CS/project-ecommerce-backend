class CartsController < ApplicationController
    skip_before_action :authorize_admin_user, only: [:create, :delete]
    skip_before_action :authorize_user, only: [:create, :delete]


    def create
        item = Item.find_by(id: params[:id])
        quantity = params[:quantity].to_i
        size = params[:size]
        # item data gets passed in from frontend via params
        current_order = @cart.orders.find_by(item_id: item.id, size: size)
        # @cart is an instance of Cart that was just created and the session is using this new instance as id, @current is also specific to the current session, each time a user initiatiates an action to the backend a new cart session is created,
        # so @cart is basically a blank row with an id thats tied to the current session
        if current_order && quantity > 0 
            current_order.update(quantity: quantity)
            render json: current_order, status: :ok
            # if the current item is already in the order then just update the quantity
        elsif quantity <= 0
            current_order.destroy
            head :no_content
        else
            addedItem = @cart.orders.create(item: item, quantity: quantity, size: size)
            render json: addedItem, status: :created
        end
    end
    # adds item to cart

    def delete
        @cart.orders.find_by(id: params[:id]).destroy
        head :no_content
    end
    # deletes item from cart
end
