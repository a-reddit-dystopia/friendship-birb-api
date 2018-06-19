module Api
  class UsersController < ApiController
    def index
      users = User.all
      render json: users, status: 200
    end

    def create
    end
  end
end