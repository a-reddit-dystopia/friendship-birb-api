module Api
  class UsersController < ApiController
    def index
      users = User.all
      render json: UserSerializer.new(users).serialized_json, status: 200
    end

    def create
      user = User.create(user_params)
      render json: UserSerializer.new(user).serialized_json, status: 201
    end

    protected

    def user_params
      params.require(:user).permit(:discord_name, :wow_name, :wow_server, :status)
    end
  end
end