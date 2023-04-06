class Api::ItemsController < ApplicationController
skip_before_action :authorize_admin_user, only: [:index, :show]
skip_before_action :authorize_user, only: [:index, :show, :create, :destroy, :update]
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def index
    items = Item.all
    render json: items, status: :ok
end

def show
    item = Item.find(params[:id])
    render json: item, serializer: CustomItemSerializer, status: :ok
end

def create
    item = Item.create!(item_params)
    render json: item, status: :created
end

def update
    item = Item.find(params[:id])
    item.update!(item_params)
    render json: item, status: :ok
end

def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: { success: 'Item has been deleted.' }, status: :ok
end

private

def render_not_found_response
    render json: { error: "Item not found" }, status: :not_found
end

def item_params
    params.permit( :id, :name, :size, :category, :sub_category, :quantity, :price, :description, :admin_user_id, :featured_image)
end


end
