module Api
  class UsersController < ApiController
    def index
      render json: { hooray: 'yay' }, status: 200
    end
  end
end