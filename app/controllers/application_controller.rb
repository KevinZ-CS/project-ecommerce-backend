class ApplicationController < ActionController::API
    include ActionController::Cookies
    

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
# rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :render_unprocessable_entity_response_storage

private

def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
end

# def render_unprocessable_entity_response_storage(exception)
#     render json: { errors: 'this is a test' }, status: :unprocessable_entity
# end

end
