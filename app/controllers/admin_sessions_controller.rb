class AdminSessionsController < ApplicationController
    skip_before_action :authorize_admin_user, only: :create
    skip_before_action :authorize_user, only: :create

    def create
        admin_user = AdminUser.find_by(email: params[:email])
        if admin_user&.authenticate(params[:password])
            session[:user_id] = admin_user.id
            render json: admin_user.to_json(except: [:password_digest])
        else
            render json: { errors: ['Invalid email or password.'] }, status: :unauthorized
        end
    end
    #logging in to create a session using a post request

    def destroy
        session.delete :user_id
        head :no_content
    end

end
