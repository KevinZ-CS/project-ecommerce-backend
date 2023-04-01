class UsersController < ApplicationController
    skip_before_action :authorize_admin_user, only: [:create, :show]
    skip_before_action :authorize_user, only: :create

    def create
        # user = User.create!(user_params)
        # session[:user_id] = user.id
        #we are also creating a session when an account is created
        user = User.create!(
            first_name: params[:first_name],
            last_name: params[:last_name],
            access_type: params[:access_type],
            email: params[:email].downcase,
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            terms_of_service: params[:terms_of_service],
        )
        render json: user, status: :created
    end

    def show
        render json: @current_user
    end

    # private

    # def user_params
    #     params.permit(:first_name, :last_name, :access_type, :email, :password, :password_confirmation, :terms_of_service)
    # end
end
