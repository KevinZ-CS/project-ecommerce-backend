class ApplicationController < ActionController::API
    include ActionController::Cookies
    

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
# rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :render_unprocessable_entity_response_storage
before_action :authorize_admin_user
before_action :authorize_user


before_action :initialize_cart
#putting before acction in application controller will run authorize for every controller inheriting from application controller

private


def initialize_cart
    # @cart = Cart.find_or_create_by(id: session[:cart_id]) 
    @cart ||= Cart.find_by(id: session[:cart_id])
    # || = means if cart doesnt exist set cart to Cart.find
    if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
    # if we cant find a cart then we create one
    #issue is that we will be creating a bunch of empty carts but we cant delete those instances once we checkout
end

def authorize_admin_user
    @current_admin_user = AdminUser.find_by(id: session[:user_id])
    # looking if that sessions exists
  
    render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_admin_user
    #will return error unless current user is true(has a value except false or nil)
  end

def authorize_user
    @current_user = User.find_by(id: session[:user_id])
    # looking if that sessions exists
  
    render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_user
    #will return error unless current user is true(has a value except false or nil)
  end

def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
end

# def render_unprocessable_entity_response_storage(exception)
#     render json: { errors: 'this is a test' }, status: :unprocessable_entity
# end

end
