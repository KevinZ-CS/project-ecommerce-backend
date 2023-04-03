class ItemsController < ApplicationController
    skip_before_action :authorize_admin_user, only: [:index, :show]
    skip_before_action :authorize_user, only: [:index, :show, :create, :destroy, :update]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

   

    def index

        # items = Rails.cache.fetch("all_items", expires_in: 30.minutes) do 
        #     redis = Redis.new(host: "localhost")
        #     redis.set("all_items", Item.all.to_json)
        #     JSON.parse redis.get("all_items")
        #     Marshal.load(redis.get("all_items"))
        #     data = Item.all
        # end
        items = Item.all
        render json: items, status: :ok
    end

    def show
        item = Item.find(params[:id])
        render json: item, serializer: CustomItemSerializer, status: :ok
        # render json: item, adapter: nil, include: [:reviews, :featured_image], status: :ok
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
