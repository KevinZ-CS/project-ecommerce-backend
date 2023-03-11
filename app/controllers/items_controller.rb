class ItemsController < ApplicationController

    def index
        @items = Item.all
        render json: @items
    end

    def show
        @item = Item.find(params[:id])
        render json: @item, status: :ok
    end

    def create
        @item = Item.create(item_params)
        render json: @item
    end

    private
    def item_params
        params.permit(:name, :size, :category, :quantity, :price, :description, :posted_by, :featured_image)
    end


end
