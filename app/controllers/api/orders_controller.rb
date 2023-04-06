class Api::OrdersController < ApplicationController
skip_before_action :authorize_admin_user, only: :index
skip_before_action :authorize_user, only: :index

def index
    order = @cart.orders
    render json: order, status: :ok
end

end
