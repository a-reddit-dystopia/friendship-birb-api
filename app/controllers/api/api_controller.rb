module Api
  class Unauthorized < StandardError; end

  class ApiController < ActionController::API
    include ActionController::MimeResponds

    before_action :verify_dumb_token

    rescue_from Unauthorized, with: :unauthorized

    protected

    def unauthorized(exception)
      render json: { reference_id: request.uuid, errors: ['Unauthorized'] }, status: 401
    end

    def verify_dumb_token
      auth_header = request.headers['HTTP_AUTHORIZATION'] || ''
      elroy_token = auth_header.split('Bearer ')[1]

      if elroy_token != ENV['ELROY']
        raise Unauthorized
      end
    end
  end
end
