class Api::AdminUsersController < ApplicationController
skip_before_action :authorize_admin_user, only: :create
skip_before_action :authorize_user, only: [:create, :show]

def create
    admin_user = AdminUser.create!(
        first_name: params[:first_name],
        last_name: params[:last_name],
        access_type: params[:access_type],
        email: params[:email].downcase,
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        terms_of_service: params[:terms_of_service],
    )
    render json: admin_user, status: :created
end

def show
    render json: @current_admin_user
end
 
end
