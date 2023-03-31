class AdminUsersController < ApplicationController
    
    skip_before_action :authorize_admin_user, only: :create
    skip_before_action :authorize_user, only: [:create, :show]


    def create
        admin_user = AdminUser.create!(admin_user_params)
           # session[:user_id] = admin_user.id
        render json: admin_user, status: :created
    end

    def show
        render json: @current_admin_user
    end
 
 
    private
 
 
    def admin_user_params
        params.permit(:first_name, :last_name, :access_type, :email, :password, :password_confirmation, :terms_of_service)
    end
end
