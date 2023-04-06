class Api::ReviewsController < ApplicationController
skip_before_action :authorize_admin_user, only: :create
skip_before_action :authorize_user, only: :destroy

def create
    if Review.find_by(user_id: params[:user_id]) && Review.find_by(item_id: params[:item_id])
    render json: { errors: { unauthorized: 'You have left a review for this item already.' } }, status: :unauthorized
    else
    review = Review.create!(review_params)
    render json: review, status: :created
    end
end

def destroy
    review = Review.find_by(id: params[:id])
    review.destroy
    head :no_content
end

private

def review_params
    params.permit(:rating, :comment, :item_id, :user_id)
end

end
