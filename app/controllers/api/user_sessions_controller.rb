class Api::UserSessionsController < ApplicationController
skip_before_action :authorize_admin_user, only: [:create, :destroy]
skip_before_action :authorize_user, only: :create

def create
    if session[:admin_user_id] || session[:user_id]
        render json: { errors: ['User already logged in.'] }, status: :unauthorized
    else
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user.to_json(except: [:password_digest])
        else
            render json: { errors: ['Invalid username or password'] }, status: :unauthorized
        end
    end
end
   
def destroy
    session.delete :user_id
    head :no_content
end

end

