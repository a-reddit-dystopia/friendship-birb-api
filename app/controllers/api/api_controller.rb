module Api
  class ApiController < ActionController::Base
    include ActionController::MimeResponds

    before_action :verify_dumb_token
    respond_to :json

    protected

    def verify_dumb_token
      elroy_token = request.headers['HTTP_AUTHORIZATION'].split('Elroy ')[1]

      return elroy_token == ENV['ELROY']
    end
  end
end
