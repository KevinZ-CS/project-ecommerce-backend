class AdminUsersController < ApplicationController
    skip_before_action :authorize, only: :create


    def create
        @user = AdminUser.create!(admin_user_params)
        render json: @user, status: :created
    end

    def show
        render json: @current_user
    end
 
 
    private
 
 
    def admin_user_params
        params.permit(:first_name, :last_name, :access_type, :email, :password, :password_confirmation, :terms_of_service)
    end
end
