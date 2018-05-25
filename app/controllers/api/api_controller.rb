module Api
  class ApiController < ActionController::Base
    before_filter :verify_dumb_token

    protected

    def verify_dumb_token
      elroy_token = request.headers['HTTP_AUTHORIZATION'].split('Elroy ')[1]

      return elroy_token == ENV['ELROY']
    end
  end
end
