class ItemsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   

    def index
        @items = Item.all
        render json: @items, status: :ok
    end

    def show
        @item = Item.find(params[:id])
        render json: @item, status: :ok
    end

    def create
        @item = Item.create!(item_params)
        render json: @item, status: :created
    end

    private

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end


    def item_params
        params.permit(:name, :size, :category, :quantity, :price, :description, :admin_user_id, :featured_image)
    end


end
