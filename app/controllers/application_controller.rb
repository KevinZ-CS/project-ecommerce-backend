class ApplicationController < ActionController::API
include ActionController::Cookies
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
before_action :authorize_admin_user
before_action :authorize_user
before_action :initialize_cart

private

def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])
    if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
end

def authorize_admin_user
    @current_admin_user = AdminUser.find_by(id: session[:admin_user_id])
  
    render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_admin_user
  end

def authorize_user
    @current_user = User.find_by(id: session[:user_id])
  
    render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_user
  end

def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
end


end
