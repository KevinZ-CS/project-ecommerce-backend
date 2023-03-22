class UserSessionsController < ApplicationController
    skip_before_action :authorize_admin_user, only: :create
    skip_before_action :authorize_user, only: :create


    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user.to_json(except: [:password_digest])
        else
            render json: { errors: ['Invalid username or password'] }, status: :unauthorized
        end
    end
    #logging in to create a session using a post request

    def destroy
        session.delete :user_id
        head :no_content
    end

end

